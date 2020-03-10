import 'package:example_project/models/app_user.dart';

class AuthState {
  AppUser appUser;

  AuthState({
    this.appUser,
  });
}

AuthState initialAuthState = new AuthState(
  appUser: null,
);