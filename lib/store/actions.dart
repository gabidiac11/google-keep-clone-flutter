import 'package:redux/redux.dart';

import '../models.dart';

enum ActionType {
  setNotes,
  addNote,
  deleteNotes
}

class Action2 {
  final ActionType type;
  final dynamic payload;
  Action2(this.type, this.payload);
}

class NotesViewModel {
  final List<NoteItemType> notes;
  final Function setNotes;

  NotesViewModel({
    required this.notes,
    required this.setNotes,
  });

  static NotesViewModel fromStore(context, Store<AppState> store) {
    return NotesViewModel(
      notes: store.state.notes,
      setNotes: (newNotes) =>
          store.dispatch(Action2(ActionType.setNotes, newNotes)),
    );
  }
}
