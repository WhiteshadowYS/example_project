import 'package:flutter/material.dart';

import 'package:example_project/store/ui/ui_state.dart';
import 'package:example_project/store/shared/base_action.dart';

class HideDialog extends BaseAction {
  HideDialog() : super(type: 'HideDialog');
}

class DisplayDialog extends BaseAction {
  final String message;

  DisplayDialog({@required this.message}) : super(type: 'DisplayDialog');
}

class ChangeLoading extends BaseAction {
  final bool nextValue;
  final LoadingKeys loadingKey;

  ChangeLoading({@required this.loadingKey, @required this.nextValue}) : super(type: 'ChangeLoading');
}
