import 'dart:convert';

import 'package:flutter/material.dart';

class NoteItemType {
  final String id;
  final String title;
  final String text;

  const NoteItemType(this.id, this.title, this.text);

  dynamic toJson() {
    return {'id': id, 'title': title, 'text': text};
  }

  static NoteItemType fromJson(dynamic data) {
    return NoteItemType(data['id'], data['title'], data['text']);
  }
}

class AppState {
  final List<NoteItemType> notes;
  AppState(this.notes);

  static genInitialState() {
    return AppState([]);
  }

  static AppState? fromJson(dynamic json) {
    print("json:");
    print(json);
    if (json == null) {
      return null;
    }
    try {
      List<NoteItemType> list = [];
      for(var item in json["notes"]) {
        list.add(NoteItemType.fromJson(item));
      }
      return AppState(list);
    } catch(err) {
      debugPrint("Error while parsing!" + err.toString());
      debugPrintStack();
    }

    return null;
  }

  dynamic toJson() {
    return {'notes': notes};
  }
}
