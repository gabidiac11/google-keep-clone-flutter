import 'package:flutter/material.dart';
import 'package:untitled2/views/allNotes/allNotesView.dart';
import 'package:untitled2/views/addOrEditNoteView/addOrEditNoteView.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google Keep Clone',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const AllNotesView(),
        '/second': (context) => AddOrEditNoteView(),
      },
    );
  }
}
