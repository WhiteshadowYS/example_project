import 'package:example_project/application.dart';
import 'package:example_project/store/app/app_epic.dart';
import 'package:example_project/store/app/app_reducer.dart';
import 'package:example_project/store/app/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:redux/redux.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';


void main() async {
  /// This method needs to be called to prevent a crash on initialization.
  WidgetsFlutterBinding.ensureInitialized();

  Store store = new Store<AppState>(
    appReducer,
    initialState: initialAppState,
    middleware: [
      new EpicMiddleware(appEpic),
      NavigationMiddleware<AppState>(),
    ],
  );

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(
    Application(
      store: store
    ),
  );
}
