import 'package:flutter/material.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({
    Key? key,
    required this.title,
    required this.text,
    required this.onPress,
    required this.onLongPressEnd,
    this.isSelected = false,
  }) : super(key: key);

  final String title;
  final String text;
  final bool isSelected;
  final void Function() onPress;
  final void Function(LongPressEndDetails d) onLongPressEnd;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPress,
        onLongPressEnd: onLongPressEnd,
        child: Card(
            color: Colors.black26,
            shape: RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(
                Radius.circular(12.0),
              ),
              side: BorderSide(
                  color: isSelected ? Colors.orange : Colors.grey, width: 3),
            ),
            child: Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(title,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      const Padding(padding: EdgeInsets.all(8)),
                      Text(text,
                          textAlign: TextAlign.start,
                          style: const TextStyle(color: Colors.white),
                          maxLines: 50),
                    ],
                  ),
                ))));
  }
}
