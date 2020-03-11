import 'package:redux_epics/redux_epics.dart';
import 'package:example_project/store/app/app_state.dart';

import 'package:example_project/store/initialize/epics/start_Initialization_epic.dart';
import 'package:example_project/store/initialize/epics/do_get_initial_user.dart';

final initializeEpics = combineEpics<AppState>([
  startInitializationEpic,
  doGetInitialUser,
]);
