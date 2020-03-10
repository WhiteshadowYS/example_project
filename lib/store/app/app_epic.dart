import 'package:example_project/store/app/app_state.dart';
import 'package:example_project/store/auth/epics/index.dart';
import 'package:example_project/store/initialize/epics/index.dart';
import 'package:example_project/store/ui/epics/index.dart';
import 'package:redux_epics/redux_epics.dart';

final appEpic = combineEpics<AppState>([
//  uiEpics,
  authEpics,
  initializeEpics,
]);
