import 'package:example_project/store/auth/auth_state.dart';
import 'package:example_project/store/initialize/initialize_state.dart';
import 'package:example_project/store/ui/ui_state.dart';
import 'package:flutter/material.dart';

class AppState {
  final UIState                 ui;
  final AuthState               auth;
  final AppInitializationState  initialization;

  AppState({
    @required this.ui,
    @required this.auth,
    @required this.initialization,
  });
}

AppState initialAppState = new AppState(
  ui:                   initialUIState,
  auth:                 initialAuthState,
  initialization:       initialInitializationState,
);
