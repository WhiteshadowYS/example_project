import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:example_project/store/app/app_state.dart';
import 'package:example_project/store/auth/auth_actions.dart';

import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';
import 'package:example_project/utils/consts.dart';

Stream<dynamic> logoutEpic(Stream<dynamic> actions, EpicStore<AppState> store) {
  return new Observable(actions)
      .whereType<Logout>()
      .switchMap(
        (action) {
      return new Observable(
        new ConcatStream(
          <Stream>[
            new Stream.fromIterable([
//              ChangeLoading(loadingKey: LoadingKeys.loginInProgress, nextValue: true),
              DoLogout(),
            ]),

            Observable.zip(
                <Stream>[
                  Observable(actions).where(
                    (event) => (event.runtimeType == LogoutSuccess || event.runtimeType == LogoutFailed),
                  ),
                  Observable.just(1).take(1),
                ],
                    (values) {
                  if (values.first.runtimeType == LogoutSuccess) {
                    LogoutSuccess nAction = values.first as LogoutSuccess;

                    return Observable(
                      new ConcatStream([
                        Stream.fromIterable([
//                          ChangeLoading(
//                            loadingKey: LoadingKeys.loginInProgress,
//                            nextValue: false,
//                          ),
                          NavigateToAction.push(ROUTE_LOGIN_PAGE),
                        ]),
                      ]),
                    );

                  } else if (values.first.runtimeType == LogoutFailed) {
                    LogoutFailed nAction = values.first as LogoutFailed;

                    return Observable(
                      new ConcatStream([
                        Stream.fromIterable([
//                          ChangeLoading(
//                            loadingKey: LoadingKeys.loginInProgress,
//                            nextValue: false,
//                          ),
                          // TODO: SHOW ERROR DIALOG
                        ]),
                      ]),
                    );

                  } else {
                    return Observable(
                      new ConcatStream([
                        Stream.fromIterable([
//                          ChangeLoading(
//                            loadingKey: LoadingKeys.loginInProgress,
//                            nextValue: false,
//                          ),
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