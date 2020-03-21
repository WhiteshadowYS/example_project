import 'package:redux/redux.dart';

import 'package:example_project/store/app/app_state.dart';
import 'package:example_project/store/auth/auth_actions.dart';
import 'package:example_project/modules/pages/login/login_page_view_model.dart';

LoginPageViewModel loginPageConverter(Store<AppState> store) {
  return LoginPageViewModel(
    login: (String email, String password) => store.dispatch(Login(email: email, password: password)),
  );
}