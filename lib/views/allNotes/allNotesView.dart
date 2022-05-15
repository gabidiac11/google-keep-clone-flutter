import 'dart:async';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:untitled2/models.dart';
import 'package:untitled2/store/actions.dart';
import 'package:untitled2/views/allNotes/navBar.dart';
import 'package:untitled2/views/allNotes/navBarSelection.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:untitled2/views/allNotes/noteItem.dart';

class AllNotesView extends StatefulWidget {
  const AllNotesView({Key? key}) : super(key: key);

  @override
  State<AllNotesView> createState() => _AllNotesViewState();
}

class _AllNotesViewState extends State<AllNotesView> {
  var selectionModeActive = false;
  var selectedIds = {};
  var isListLayout = false;
  var searchTxt = "";
  TextEditingController searchController = TextEditingController();

  var isLoadingList = true;

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  List<NoteItemType> getListFiltered(notes) {
    return searchTxt == ""
        ? notes
        : notes.where((i) {
            return [i.title, i.text].any((value) {
              return (value is String) &&
                  value.toLowerCase().contains(searchTxt);
            });
          }).toList();
  }

  @override
  void initState() {
    searchController.addListener(() {
      setState(() {
        searchTxt = searchController.text.toLowerCase();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, NotesViewModel>(
        onInit: (store) {
          Timer(const Duration(seconds: 1), () {
            setState(() {
              isLoadingList = false;
            });
          });
        },
        converter: (store) => NotesViewModel.fromStore(context, store),
        builder: (context, model) => Scaffold(
              appBar: selectionModeActive
                  ? NavBarSelection(selectedIds.keys.length,
                      () => onDeleteSelected(model), onCancelSelection)
                  : MyAppBar(isListLayout, setIsListLayout, searchController),
              backgroundColor: Theme.of(context).backgroundColor,
              body: SingleChildScrollView(
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5, 25, 5, 22),
                    child: isLoadingList
                        ? const Text("Loading...")
                        : getListFiltered(model.notes).isEmpty
                            ? const Text("No item.")
                            : StaggeredGrid.count(
                                crossAxisCount: isListLayout
                                    ? 1
                                    : determineItemsPerRow(
                                        MediaQuery.of(context).size.width),
                                mainAxisSpacing: 2,
                                crossAxisSpacing: 4,
                                children: getListFiltered(model.notes)
                                    .map((item) => NoteItem(
                                          title: item.title,
                                          onPress: () => onPressNote(item),
                                          onLongPressEnd: (d) =>
                                              onLongPressEnd(item.id),
                                          isSelected:
                                              selectedIds[item.id] == true,
                                          text: item.text,
                                        ))
                                    .toList(),
                              ),
                  )
                ]),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () => Navigator.pushNamed(context, '/addOrEdit'),
                tooltip: 'Add note',
                backgroundColor: Theme.of(context).canvasColor,
                child: Icon(Icons.add, color: Theme.of(context).primaryIconTheme.color),
              ),
            ));
  }

  int determineItemsPerRow(double width) {
    if (width < 350) {
      return 2;
    }
    return (width / 175).floor();
  }

  onLongPressEnd(String itemId) {
    setState(() {
      if (!selectionModeActive) {
        selectionModeActive = true;
      }
      if (selectedIds[itemId] == true) {
        selectedIds.remove(itemId);
        return;
      }
      selectedIds[itemId] = true;
    });
  }

  onDeleteSelected(NotesViewModel model) {
    //TODO: delete from db
    var notes = model.notes
        .where((element) => selectedIds[element.id] != true)
        .toList();
    model.setNotes(notes);

    setState(() {
      selectedIds = {};
      selectionModeActive = false;
    });
  }

  onCancelSelection() {
    setState(() {
      selectedIds = {};
      selectionModeActive = false;
    });
  }

  onPressNote(NoteItemType item) {
    if (!selectionModeActive) {
      Navigator.pushNamed(context, '/addOrEdit', arguments: item);
      return;
    }
    var itemId = item.id;
    setState(() {
      if (selectedIds[itemId] == true) {
        selectedIds.remove(itemId);
      } else {
        selectedIds[itemId] = true;
      }
    });
  }

  setIsListLayout(bool value) {
    setState(() {
      isListLayout = value;
    });
  }
}
