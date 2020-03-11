import 'package:example_project/store/ui/dialog_display.dart';
import 'package:example_project/store/ui/ui_actions.dart';
import 'package:example_project/store/ui/ui_state.dart';

UIState uiReducer(UIState state, dynamic action) {
  print('[uiReducer] => ${action.runtimeType}');

  switch (action.runtimeType) {
    case ChangeLoading:
      ChangeLoading nAction = action as ChangeLoading;
      state.setValueForLoadingKey(
        nAction.loadingKey,
        nAction.nextValue,
      );
      return state;

    case HideDialog:
      state.removeAllDialogDisplay();
      return state;

    case DisplayDialog:
      DisplayDialog nAction = action as DisplayDialog;

      state.addDialogDisplay(
        DialogDisplay(nAction.message),
      );
      return state;

    default:
      return state;
  }
}
