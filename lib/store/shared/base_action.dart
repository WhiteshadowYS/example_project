import 'package:flutter/material.dart';
import 'package:example_project/network/shared/api_error.dart';

class BaseAction {
  final dynamic type;

  BaseAction({@required this.type});
}

class EmptyAction extends BaseAction {
  EmptyAction() : super(type: 'EmptyAction');
}

/// Used to allow a centralized epic to deal with "UNAUTHORIZED" http response.
class APIErrorAction extends BaseAction {
  final APIError error;

  APIErrorAction({@required this.error, @required type}) : super(type:type);
}
