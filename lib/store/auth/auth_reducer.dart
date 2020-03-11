import 'package:example_project/store/auth/auth_state.dart';
import 'package:example_project/store/auth/auth_actions.dart';

AuthState authReducer(AuthState state, dynamic action) {
  print('[authReducer] => ${action.runtimeType}');

  switch (action.runtimeType) {
    case DoSaveUser:
      DoSaveUser nAction = action as DoSaveUser;

      if (nAction?.user == null) {
        return state;
      }

      return AuthState(
        appUser: nAction.user,
      );

    case DoDeleteUser:
      DoDeleteUser nAction = action as DoDeleteUser;

      return AuthState(
        appUser: null,
      );

    default:
      return state;
  }
}
