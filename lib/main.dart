import 'package:flutter/material.dart';
import 'package:untitled2/models.dart';
import 'package:untitled2/store/actions.dart';
import 'package:untitled2/theme/SharedPreferences.dart';
import 'package:untitled2/theme/Theme.dart';
import 'package:untitled2/views/allNotes/allNotesView.dart';
import 'package:untitled2/views/addOrEditNoteView/addOrEditNoteView.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'store/reducer.dart';
import 'package:untitled2/store/reducer.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:provider/provider.dart';

void main() {
  final Store<AppState> store = Store<AppState>(
    reducer,
    initialState: AppState.genInitialState(),
    middleware: [thunkMiddleware],
  );
  runApp(MyApp(store));
}

class MyApp extends StatefulWidget {
  final Store<AppState> store;
  const MyApp(this.store, {Key? key}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (_) {
      return themeChangeProvider;
    }, child: Consumer<DarkThemeProvider>(
      builder: (context, value, Widget? child) {
        return StoreProvider(
            store: widget.store,
            child: MaterialApp(
                title: 'Google Keep Clone',
                theme: Styles.themeData(themeChangeProvider.darkTheme, context),
                initialRoute: '/',
                routes: {
                  '/': (context) => const AllNotesView(),
                  '/addOrEdit': (context) =>
                      StoreConnector<AppState, NotesViewModel>(
                        converter: (store) =>
                            NotesViewModel.fromStore(context, store),
                        builder: (context, model) => AddOrEditNoteView(model),
                      )
                }));
      },
    ));
  }
}
