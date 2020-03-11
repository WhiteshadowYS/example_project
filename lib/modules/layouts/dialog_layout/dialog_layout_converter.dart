import 'package:example_project/store/ui/ui_actions.dart';
import 'package:redux/redux.dart';
import 'package:example_project/store/app/app_state.dart';
import 'package:example_project/modules/layouts/dialog_layout/dialog_layout_view_model.dart';

DialogLayoutViewModel dialogLayoutConverter(Store<AppState> store) {
  return DialogLayoutViewModel(
    store:        store,
    hideDialog:   () => store.dispatch(HideDialog()),
  );
}