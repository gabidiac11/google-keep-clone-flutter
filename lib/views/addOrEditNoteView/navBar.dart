import 'package:flutter/material.dart';

class MyAppBar extends AppBar {
  MyAppBar({Key? key}) : super(key: key);
  @override
  State<MyAppBar> createState() => _MyAppBar();
}

class _MyAppBar extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Row(children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 1, 0, 1),
          child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(Icons.arrow_back)),
        )
      ])
    );
  }
}
