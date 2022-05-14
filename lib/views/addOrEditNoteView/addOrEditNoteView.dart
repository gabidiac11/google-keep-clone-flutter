import 'package:flutter/material.dart';
import 'package:untitled2/views/addOrEditNoteView/navBar.dart';

class AddOrEditNoteView extends StatefulWidget {
  AddOrEditNoteView({Key? key}) : super(key: key);

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
      Map arguments = ModalRoute.of(context)?.settings.arguments as Map;
      id = arguments['id'];
      titleController.text = arguments['title'];
      textController.text = arguments['text']!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      backgroundColor: Colors.black26,
      appBar: MyAppBar(),
      body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(children: [
              TextField(
                style: const TextStyle(color: Colors.white, fontSize: 20),
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
                  maxLines: 9000
              )
            ]),
          )),
    ));
  }

  int determineItemsPerRow(double width) {
    if (width < 350) {
      return 2;
    }
    return (width / 175).floor();
  }
}
