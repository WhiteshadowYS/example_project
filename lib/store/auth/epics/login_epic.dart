import 'dart:async';
import 'package:example_project/store/ui/ui_actions.dart';
import 'package:example_project/store/ui/ui_state.dart';
import 'package:rxdart/rxdart.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:example_project/store/app/app_state.dart';
import 'package:example_project/store/auth/auth_actions.dart';

import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';
import 'package:example_project/utils/consts.dart';

Stream<dynamic> loginEpic(Stream<dynamic> actions, EpicStore<AppState> store) {
  return new Observable(actions)
      .whereType<Login>()
      .switchMap(
        (action) {
      return new Observable(
        new ConcatStream(
          <Stream>[
            new Stream.fromIterable([
              ChangeLoading(loadingKey: LoadingKeys.login, nextValue: true),
              DoLogin(
                email:    action.email,
                password: action.password,
              ),
            ]),

            Observable.zip(
                <Stream>[
                  Observable(actions).where(
                    (event) => (event.runtimeType == LoginSuccess || event.runtimeType == LoginFailed),
                  ),
                  Observable.just(1).take(1),
                ],
                    (values) {
                  if (values.first.runtimeType == LoginSuccess) {
                    LoginSuccess nAction = values.first as LoginSuccess;

                    return Observable(
                      new ConcatStream([
                        Stream.fromIterable([
                          ChangeLoading(
                            loadingKey: LoadingKeys.login,
                            nextValue: false,
                          ),
                          DoSaveUser(user:  nAction.user),
                          NavigateToAction.push(ROUTE_HOME_PAGE),
                        ]),
                      ]),
                    );

                  } else if (values.first.runtimeType == LoginFailed) {
                    LoginFailed nAction = values.first as LoginFailed;

                    return Observable(
                      new ConcatStream([
                        Stream.fromIterable([
                          ChangeLoading(
                            loadingKey: LoadingKeys.login,
                            nextValue: false,
                          ),
                          DisplayDialog(message: nAction.error.readableError),
                        ]),
                      ]),
                    );

                  } else {
                    return Observable(
                      new ConcatStream([
                        Stream.fromIterable([
                          ChangeLoading(
                            loadingKey: LoadingKeys.login,
                            nextValue: false,
                          ),
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