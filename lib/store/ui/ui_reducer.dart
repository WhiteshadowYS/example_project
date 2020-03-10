import 'package:example_project/store/ui/ui_state.dart';

UIState uiReducer(UIState state, dynamic action) {
  print('[uiReducer] => ${action.runtimeType}');

  switch (action.runtimeType) {

    default:
      return state;
  }
}
