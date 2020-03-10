import 'dart:async';
import 'package:example_project/store/initialize/initialize_actions.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:example_project/store/app/app_state.dart';

import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';
import 'package:example_project/utils/consts.dart';

Stream<dynamic> startInitializationEpic(Stream<dynamic> actions, EpicStore<AppState> store) {
  return new Observable(actions)
      .whereType<StartInitialization>()
      .switchMap(
        (action) {
      return new Observable(
        new ConcatStream(
          <Stream>[
            new Stream.fromIterable([
              FinishInitialization(),
              NavigateToAction.pushNamedAndRemoveUntil(ROUTE_LOGIN_PAGE, (Route<dynamic> route) => false)
            ]),
          ],
        ),
      );
    },
  );
}