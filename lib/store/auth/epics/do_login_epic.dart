import 'package:example_project/models/app_user.dart';
import 'package:example_project/repositories/auth_repository.dart';
import 'package:example_project/repositories/shared/base_response.dart';
import 'package:example_project/store/app/app_state.dart';
import 'package:example_project/store/auth/auth_actions.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';

Stream<dynamic> doLoginEpic(Stream<dynamic> actions, EpicStore<AppState> store) {
  return Observable(actions)
      .whereType<DoLogin>()
      .asyncMap((action) {
    return AuthRepository
        .instance
        .login(
          email:    action.email,
          password: action.password,
        )
        .then((BaseResponse<AppUser> result) {
      if (result.error != null)
        return LoginFailed(error: result.error);

      return LoginSuccess(user: result.response);
    },
    );
  },
  );
}
