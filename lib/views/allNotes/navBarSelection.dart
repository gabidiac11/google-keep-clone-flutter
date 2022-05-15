import 'package:flutter/material.dart';

class _MyAppBar extends State<NavBarSelection> {
  Widget withPadding(Widget w) {
    return Padding(padding: const EdgeInsets.fromLTRB(10, 0, 10, 0), child: w);
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(children: [
        withPadding(GestureDetector(
            onTap: () => widget.cancel(), child: const Icon(Icons.close))),
        withPadding(Text(widget.numOfItems.toString())),
      ]),
      actions: [
        withPadding(GestureDetector(
            onTap: () => widget.delete(), child: const Icon(Icons.delete)))
      ],
    );
  }
}

class NavBarSelection extends AppBar {
  final int numOfItems;
  final Function delete;
  final Function cancel;
  NavBarSelection(this.numOfItems, this.delete, this.cancel, {Key? key})
      : super(key: key);
  @override
  State<NavBarSelection> createState() => _MyAppBar();
}
