import 'package:example_project/store/auth/auth_actions.dart';
import 'package:redux/redux.dart';
import 'package:example_project/store/app/app_state.dart';
import 'package:example_project/modules/pages/home/home_page_view_model.dart';

HomePageViewModel homePageConverter(Store<AppState> store) {
  return HomePageViewModel(
    signout: () => store.dispatch(Logout())
  );
}