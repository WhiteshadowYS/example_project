import 'package:example_project/models/app_user.dart';
import 'package:example_project/store/shared/base_action.dart';
import 'package:flutter/cupertino.dart';

// region [Login]
class Login extends BaseAction {
  final String email;
  final String password;

  Login({
    @required this.email,
    @required this.password,
  }) : super(type: 'Login');
}

class DoLogin extends BaseAction {
  final String email;
  final String password;

  DoLogin({
    @required this.email,
    @required this.password,
  }) : super(type: 'DoLogin');
}

class LoginSuccess extends BaseAction {
  final AppUser user;

  LoginSuccess({@required this.user}) : super(type: 'LoginSuccess');
}

class LoginFailed extends APIErrorAction {
  LoginFailed({error}) : super(type: 'LoginFailed', error: error);
}

class DoSaveUser extends BaseAction {
  final AppUser user;

  DoSaveUser({@required this.user}) : super(type: 'DoSaveUser');
}

class DoDeleteUser extends BaseAction {
  DoDeleteUser() : super(type: 'DoDeleteUser');
}
// endregion

// region [Logout]
class Logout extends BaseAction {
  Logout() : super(type: 'Logout');
}

class DoLogout extends BaseAction {
  DoLogout() : super(type: 'DoLogout');
}

class LogoutSuccess extends BaseAction {
  LogoutSuccess() : super(type: 'LogoutSuccess');
}

class LogoutFailed extends APIErrorAction {
  LogoutFailed({error}) : super(type: 'LogoutFailed', error: error);
}
// endregion