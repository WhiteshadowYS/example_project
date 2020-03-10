import 'package:example_project/store/initialize/initialize_actions.dart';
import 'package:example_project/store/initialize/initialize_state.dart';

AppInitializationState initializationReducer(AppInitializationState state, dynamic action) {
  switch (action.runtimeType) {
    case StartInitialization:
      return Initializing();

    case FinishInitialization:
      return Initialized();

    default:
      return state;
  }
}
