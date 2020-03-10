import 'package:example_project/store/app/app_state.dart';
import 'package:example_project/store/auth/auth_reducer.dart';
import 'package:example_project/store/initialize/initialize_reducer.dart';
import 'package:example_project/store/ui/ui_reducer.dart';


AppState appReducer(AppState state, dynamic action) {
  print('[appReducer] => [UI uiReducer] => ${action.runtimeType}');
  return AppState(
    ui:                         uiReducer(state.ui, action),
    auth:                       authReducer(state.auth, action),
    initialization:             initializationReducer(state.initialization, action),
  );
}
