import 'package:example_project/models/app_user.dart';
import 'package:example_project/repositories/auth_repository.dart';
import 'package:example_project/repositories/shared/base_response.dart';
import 'package:example_project/store/app/app_state.dart';
import 'package:example_project/store/auth/auth_actions.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';

Stream<dynamic> doLogoutEpic(Stream<dynamic> actions, EpicStore<AppState> store) {
  return Observable(actions)
      .whereType<DoLogout>()
      .asyncMap((action) {
    return AuthRepository
        .instance
        .logout()
        .then((BaseResponse<String> result) {
      if (result.error != null)
        return LogoutFailed(error: result.error);

      return LogoutSuccess();
    },
    );
  },
  );
}
