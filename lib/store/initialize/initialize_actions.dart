import 'package:example_project/models/app_user.dart';
import 'package:example_project/store/shared/base_action.dart';
import 'package:flutter/material.dart';

class StartInitialization extends BaseAction {
  StartInitialization() : super(type: 'StartInitialization');
}

class FinishInitialization extends BaseAction {
  FinishInitialization() : super(type: 'FinishInitialization');
}

class DoGetInitialUser extends BaseAction {
  DoGetInitialUser() : super(type: 'DoGetInitialUser');
}

class DoGetInitialUserSuccess extends BaseAction {
  final AppUser user;

  DoGetInitialUserSuccess({@required this.user}) : super(type: 'DoGetInitialUserSuccess');
}

class DoGetInitialUserFailed extends APIErrorAction {
  DoGetInitialUserFailed({error}) : super(type: 'DoGetInitialUserFailed', error: error);
}