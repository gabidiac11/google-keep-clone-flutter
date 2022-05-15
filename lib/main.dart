import 'package:flutter/material.dart';
import 'package:untitled2/models.dart';
import 'package:untitled2/store/actions.dart';
import 'package:untitled2/views/allNotes/allNotesView.dart';
import 'package:untitled2/views/addOrEditNoteView/addOrEditNoteView.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'store/reducer.dart';
import 'package:untitled2/store/reducer.dart';
import 'package:redux_thunk/redux_thunk.dart';

void main() {
  final Store<AppState> store = Store<AppState>(
    reducer,
    initialState: AppState.genInitialState(),
    middleware: [thunkMiddleware],
  );
  runApp(MyApp(store));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;
  const MyApp(this.store, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
        store: store,
        child: MaterialApp(
          title: 'Google Keep Clone',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => const AllNotesView(),
            '/addOrEdit': (context) => StoreConnector<AppState, NotesViewModel>(
                  converter: (store) =>
                      NotesViewModel.fromStore(context, store),
                  builder: (context, model) => AddOrEditNoteView(model),
                )
          }
        ));
  }
}
