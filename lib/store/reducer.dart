import 'package:untitled2/store/actions.dart';
import 'package:untitled2/models.dart';

AppState reducer(AppState previousState, dynamic _action) {
  var action = _action as Action2;
  switch (action.type) {
    case ActionType.setNotes:
      return AppState(action.payload);

    case ActionType.addNote:
      previousState.notes.add(action.payload);
      return AppState(previousState.notes);

    case ActionType.deleteNotes:
      previousState.notes.where((existingItem) {
        return action.payload.any((element) => existingItem.id == element.id);
      });
      return AppState(previousState.notes);

    default:
      return previousState;
  }
}
