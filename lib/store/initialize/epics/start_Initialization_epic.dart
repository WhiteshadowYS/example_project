import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/material.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';

import 'package:example_project/store/app/app_state.dart';
import 'package:example_project/store/auth/auth_actions.dart';

import 'package:example_project/store/initialize/initialize_actions.dart';
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
              DoGetInitialUser(),
            ]),

            Observable.zip(
                <Stream>[
                  Observable(actions).where(
                    (event) => (event.runtimeType == DoGetInitialUserSuccess || event.runtimeType == DoGetInitialUserFailed),
                  ),
                  Observable.just(1).take(1),
                ],
                    (values) {
                  if (values.first.runtimeType == DoGetInitialUserSuccess) {
                    DoGetInitialUserSuccess nAction = values.first as DoGetInitialUserSuccess;

                    return Observable(
                      new ConcatStream([
                        Stream.fromIterable([
                          DoSaveUser(user:  nAction.user),
                          FinishInitialization(),
                          NavigateToAction.pushNamedAndRemoveUntil(ROUTE_HOME_PAGE, (Route<dynamic> route) => false)
                        ]),
                      ]),
                    );

                  } else if (values.first.runtimeType == DoGetInitialUserFailed) {
                    DoGetInitialUserFailed nAction = values.first as DoGetInitialUserFailed;

                    return Observable(
                      new ConcatStream([
                        Stream.fromIterable([
                          FinishInitialization(),
                          NavigateToAction.pushNamedAndRemoveUntil(ROUTE_LOGIN_PAGE, (Route<dynamic> route) => false)
                        ]),
                      ]),
                    );

                  } else {
                    return Observable(
                      new ConcatStream([
                        Stream.fromIterable([
                          FinishInitialization(),
                          NavigateToAction.pushNamedAndRemoveUntil(ROUTE_LOGIN_PAGE, (Route<dynamic> route) => false)
                        ]),
                      ]),
                    );
                  }
                }
            ).switchMap((action) => action),
          ],
        ),
      );
    },
  );
}