import 'package:example_project/store/auth/auth_state.dart';

AuthState authReducer(AuthState state, dynamic action) {
  print('[authReducer] => ${action.runtimeType}');

  switch (action.runtimeType) {

    default:
      return state;
  }
}
