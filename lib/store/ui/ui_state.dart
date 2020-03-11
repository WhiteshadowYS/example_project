import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:example_project/store/ui/dialog_display.dart';
import 'package:example_project/store/ui/display_error.dart';


enum LoadingKeys {
  initializeLoading,
  login,
  logout,
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

  void setValueForLoadingKey(LoadingKeys loadingKey, bool value) {
    loadingKeys[loadingKey] = value;
  }

  bool getValueForLoadingKey(LoadingKeys loadingKey) {
    if (loadingKeys.containsKey(loadingKey)) {
      return loadingKeys[loadingKey];
    } else {
      return false;
    }
  }

  void setValueForLoadingStatus(bool value) {
    loadingStatus = value;
  }

  bool get getValueForLoadingStatus => loadingStatus;

  void addDialogDisplay(DialogDisplay dialogDisplay) {
    bool isDialogShown = false;

    if (dialogDisplays == null) {
      dialogDisplays = List();
    }

    dialogDisplays.forEach((DialogDisplay dialog) {
      if (dialog.message == dialogDisplay.message) isDialogShown = true;
    });

    if (!isDialogShown) dialogDisplays.add(dialogDisplay);
  }

  void removeAllDialogDisplay() {
    if (dialogDisplays != null) {
      dialogDisplays.forEach((dialog) {
      });
      dialogDisplays.clear();
    }
  }

  void addErrorDisplay(ErrorDisplay errorDisplay) {
    if (errorDisplays == null) {
      errorDisplays = List();
    }

    errorDisplays.add(errorDisplay);
  }

  void removeErrorDisplay(ErrorDisplay errorDisplay) {
    if (errorDisplays != null) {
      errorDisplays.remove(errorDisplay);
    }
  }

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
