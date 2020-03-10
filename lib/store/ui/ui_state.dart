import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:example_project/store/ui/dialog_display.dart';
import 'package:example_project/store/ui/display_error.dart';


enum LoadingKeys {
  initializeLoading,
}

enum ErrorKeys {
  loginError,
  initializingError,
}

class UIState {
  Locale                      locale;
  HashMap<ErrorKeys, String>  errorKeys;
  HashMap<LoadingKeys, bool>  loadingKeys;
  bool                        loadingStatus;
  List<ErrorDisplay>          errorDisplays;
  List<DialogDisplay>         dialogDisplays;

  PageStorageBucket bucket = PageStorageBucket();

  List<String> supportedLocales = [
    'en',
  ];

  UIState({
    this.loadingKeys,
    this.errorKeys,
    this.errorDisplays,
    this.dialogDisplays,
    this.locale,
    this.loadingStatus,
  });
}

UIState initialUIState = UIState(
  loadingKeys:          HashMap(),
  errorKeys:            HashMap(),
  locale:               Locale('en'),
  loadingStatus:        false,
);
