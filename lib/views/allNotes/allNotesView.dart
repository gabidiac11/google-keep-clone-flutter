import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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
  List<Map<String, dynamic>> notes = [
    {
      'id': 1,
      'title': "Datorii (de recuperat)",
      'text':
          "\n mai2022 | chirie 1503/2 \n mai2022 | mouse 45 \n mai2022 | factura energie 444.14 / 2 \n mai2022| cămătărie 152. 5 \n"
    },
    {
      'id': 2,
      'title': "Datorii (de recuperat)",
      'text':
          "\n mai2022 | chirie 1503/2 \n mai2022 | mouse 45 \n mai2022 | factura energie 444.14 / 2 \n mai2022| cămătărie 152. 5 \n"
    },
    {
      'id': 3,
      'title': "Datorii (de recuperat)",
      'text':
          "\n mai2022 | chirie 1503/2 \n mai2022 | mouse 45 \n mai2022 | factura energie 444.14 / 2 \n mai2022| cămătărie 152. 5 \n"
    },
    {
      'id': 4,
      'title': "Datorii1 (de recuperat)",
      'text':
          "\n mai2022 | chirie 1503/2 \n\n mai2022 | chirie 1503/2 \n\n mai2022 | chirie 1503/2 \n\n mai2022 | chirie 1503/2 \n mai2022 | mouse 45 \n mai2022 | factura energie 444.14 / 2 \n mai2022| cămătărie 152. 5 \n"
    },
    {
      'id': 5,
      'title': "Datorii2 (de recuperat)",
      'text':
          "\n mai2022 | chirie 1503/2 \n\n mai2022 | chirie 1503/2 \n\n mai2022 | chirie 1503/2 \n\n mai2022 | chirie 1503/2 \n mai2022 | mouse 45 \n mai2022 | factura energie 444.14 / 2 \n mai2022| cămătărie 152. 5 \n"
    },
    {
      'id': 6,
      'title': "Datorii3 (de recuperat)",
      'text':
          "\n mai2022 | chirie 1503/2 \n\n mai2022 | chirie 1503/2 \n\n mai2022 | chirie 1503/2 \n\n mai2022 | chirie 1503/2 \n mai2022 | mouse 45 \n mai2022 | factura energie 444.14 / 2 \n mai2022| cămătărie 152. 5 \n"
    },
    {
      'id': 7,
      'title': "Datorii (de recuperat)",
      'text':
          "\n mai2022 | chirie 1503/2 \n\n mai2022 | chirie 1503/2 \n\n mai2022 | chirie 1503/2 \n\n mai2022 | chirie 1503/2 \n mai2022 | mouse 45 \n mai2022 | factura energie 444.14 / 2 \n mai2022| cămătărie 152. 5 \n"
    },
    {
      'id': 8,
      'title': "Datorii (de recuperat)",
      'text':
          "\n mai2022 | chirie 1503/2 \n\n mai2022 | chirie 1503/2 \n\n mai2022 | chirie 1503/2 \n\n mai2022 | chirie 1503/2 \n mai2022 | mouse 45 \n mai2022 | factura energie 444.14 / 2 \n mai2022| cămătărie 152. 5 \n"
    },
    {
      'id': 9,
      'title': "Datorii (de recuperat)",
      'text':
          "\n mai2022 | chirie 1503/2 \n\n mai2022 | chirie 1503/2 \n\n mai2022 | chirie 1503/2 \n\n mai2022 | chirie 1503/2 \n mai2022 | mouse 45 \n mai2022 | factura energie 444.14 / 2 \n mai2022| cămătărie 152. 5 \n"
    },
    {
      'id': 10,
      'title': "Datorii (de recuperat)",
      'text':
          "\n mai2022 | chirie 1503/2 \n\n mai2022 | chirie 1503/2 \n\n mai2022 | chirie 1503/2 \n\n mai2022 | chirie 1503/2 \n mai2022 | mouse 45 \n mai2022 | factura energie 444.14 / 2 \n mai2022| cămătărie 152. 5 \n"
    }
  ];

  var selectionModeActive = false;
  var selectedIds = {};
  var isListLayout = false;
  var searchTxt = "";
  TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  List<Map<String, dynamic>> getListFiltered() {
    return searchTxt == ""
        ? notes
        : notes.where((i) {
      return ['title', 'text'].any((property) {
        return (i[property] is String) &&
            i[property] != null &&
            (i[property] as String).toLowerCase().contains(searchTxt);
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
    var notesFiltered = getListFiltered();

    return Scaffold(
      appBar: selectionModeActive
          ? NavBarSelection(
              selectedIds.keys.length, onDeleteSelected, onCancelSelection)
          : MyAppBar(isListLayout, setIsListLayout, searchController),
      backgroundColor: Colors.grey,
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 25, 5, 22),
            child: notesFiltered.isEmpty
                ? const Text("No item.")
                : StaggeredGrid.count(
                    crossAxisCount: isListLayout
                        ? 1
                        : determineItemsPerRow(
                            MediaQuery.of(context).size.width),
                    mainAxisSpacing: 2,
                    crossAxisSpacing: 4,
                    children: notesFiltered
                        .map((e) => NoteItem(
                              title: e['title'],
                              onPress: () => onPressNote(e['id']),
                              onLongPressEnd: (d) => onLongPressEnd(e['id']),
                              isSelected: selectedIds[e['id']] == true,
                              text: e['text'],
                            ))
                        .toList(),
                  ),
          )
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/second'),
        tooltip: 'Add note',
        child: const Icon(Icons.add),
      ),
    );
  }

  int determineItemsPerRow(double width) {
    if (width < 350) {
      return 2;
    }
    return (width / 175).floor();
  }

  onLongPressEnd(itemId) {
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

  onDeleteSelected() {
    setState(() {
      //TODO: delete from db
      notes =
          notes.where((element) => selectedIds[element['id']] != true).toList();
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

  onPressNote(itemId) {
    if (!selectionModeActive) {
      //TODO: navigate to edit
      return;
    }
    setState(() {
      if (selectedIds[itemId] == true) {
        selectedIds.remove(itemId);
      } else {
        selectedIds[itemId] = true;
      }
    });
  }

  setIsListLayout(value) {
    setState(() {
      isListLayout = value;
    });
  }
}
