import 'package:redux_epics/redux_epics.dart';

import 'package:example_project/store/app/app_state.dart';
import 'package:example_project/store/auth/epics/login_epic.dart';
import 'package:example_project/store/auth/epics/logout_epic.dart';
import 'package:example_project/store/auth/epics/do_login_epic.dart';
import 'package:example_project/store/auth/epics/do_logout_epic.dart';
import 'package:example_project/store/auth/epics/do_save_user_epic.dart';
import 'package:example_project/store/auth/epics/do_delete_user_epic.dart';

final authEpics = combineEpics<AppState>([
  doLogoutEpic,
  doLoginEpic,

  loginEpic,
  logoutEpic,

  doSaveUserEpic,
  doDeleteUserEpic,
]);
