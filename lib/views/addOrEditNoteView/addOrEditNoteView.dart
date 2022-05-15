import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:untitled2/models.dart';
import 'package:untitled2/views/addOrEditNoteView/navBar.dart';
import 'package:uuid/uuid.dart';

import '../../store/actions.dart';

class AddOrEditNoteView extends StatefulWidget {
  final NotesViewModel model;
  const AddOrEditNoteView(this.model, {Key? key}) : super(key: key);

  @override
  State<AddOrEditNoteView> createState() => _AddOrEditNoteViewState();
}

class _AddOrEditNoteViewState extends State<AddOrEditNoteView> {
  var isEditing = false;
  String? id;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      if (ModalRoute.of(context)!.settings.arguments == null) {
        return;
      }

      var arguments =
          ModalRoute.of(context)!.settings.arguments as NoteItemType;
      id = arguments.id;
      titleController.text = arguments.title;
      textController.text = arguments.text;
    });
  }

  @override
  void dispose() {
    if (id != null && widget.model.notes.any((el) => el.id == id)) {
      widget.model.setNotes(widget.model.notes.map((el) {
        if (el.id == id) {
          return NoteItemType(id!, titleController.text, textController.text);
        }
        return el;
      }).toList());
    } else if ([titleController.text, textController.text]
        .any((txt) => txt != "")) {
      widget.model.setNotes([
        NoteItemType(
            const Uuid().v1(), titleController.text, textController.text),
        ...widget.model.notes,
      ]);
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, NotesViewModel>(
        converter: (store) => NotesViewModel.fromStore(context, store),
        builder: (context, model) => Scaffold(
              backgroundColor: Colors.black26,
              appBar: MyAppBar(),
              body: Padding(
                  padding: const EdgeInsets.all(16),
                  child: SingleChildScrollView(
                    child: Column(children: [
                      TextField(
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20),
                        decoration: const InputDecoration(
                            hintText: 'Title...',
                            border: InputBorder.none,
                            hintStyle: TextStyle(color: Colors.white70)),
                        controller: titleController,
                      ),
                      const Padding(padding: EdgeInsets.all(10)),
                      TextField(
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                              hintText: 'Note...',
                              border: InputBorder.none,
                              hintStyle: TextStyle(color: Colors.white70)),
                          controller: textController,
                          maxLines: 9000)
                    ]),
                  )),
            ));
  }
}
