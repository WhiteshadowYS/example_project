import 'package:example_project/store/shared/base_action.dart';

class StartInitialization extends BaseAction {
  StartInitialization() : super(type: 'StartInitialization');
}

class FinishInitialization extends BaseAction {
  FinishInitialization() : super(type: 'FinishInitialization');
}