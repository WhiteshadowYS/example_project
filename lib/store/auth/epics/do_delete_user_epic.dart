import 'package:rxdart/rxdart.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:example_project/store/app/app_state.dart';
import 'package:example_project/store/auth/auth_actions.dart';
import 'package:example_project/repositories/auth_repository.dart';

Stream<dynamic> doDeleteUserEpic(Stream<dynamic> actions, EpicStore<AppState> store) {
  return Observable(actions)
      .whereType<DoDeleteUser>()
      .asyncMap((action) {
    return AuthRepository
        .instance
        .deleteUserFromStorage();
  },
  );
}
