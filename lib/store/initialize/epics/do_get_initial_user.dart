import 'package:example_project/models/app_user.dart';
import 'package:example_project/network/shared/api_error.dart';
import 'package:rxdart/rxdart.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:example_project/store/app/app_state.dart';
import 'package:example_project/repositories/auth_repository.dart';
import 'package:example_project/store/initialize/initialize_actions.dart';

Stream<dynamic> doGetInitialUser(Stream<dynamic> actions, EpicStore<AppState> store) {
  return Observable(actions)
      .whereType<DoGetInitialUser>()
      .asyncMap((action) {
    return AuthRepository
        .instance
        .getUserFromStorage()
        .then((AppUser user) {
        if (user != null) return DoGetInitialUserSuccess(
          user: user,
        );

        return DoGetInitialUserFailed(error: APIError.getParsingError('User not found'));
    });
  },
  );
}
