import 'package:redux/redux.dart';
import 'package:flutter/material.dart';

import 'package:example_project/store/app/app_state.dart';

class DialogLayoutViewModel {
  final Store<AppState> store;
  final void Function() hideDialog;

  DialogLayoutViewModel({
    @required this.store,
    @required this.hideDialog,
  });
}