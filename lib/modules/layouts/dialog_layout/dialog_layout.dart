import 'package:example_project/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:example_project/utils/loader.dart';
import 'package:example_project/store/ui/ui_state.dart';
import 'package:example_project/store/app/app_state.dart';
import 'package:example_project/store/ui/dialog_display.dart';
import 'package:example_project/modules/layouts/dialog_layout/dialog_layout_view_model.dart';
import 'package:example_project/modules/layouts/dialog_layout/dialog_layout_converter.dart';

import 'package:example_project/utils/empty_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class DialogLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width:  double.infinity,
      height: double.infinity,
      child: StoreConnector<AppState, DialogLayoutViewModel>(
        converter: dialogLayoutConverter,
        builder: (BuildContext context, DialogLayoutViewModel vm) {
          return Stack(
            children: <Widget>[
              vm.store.state.ui.loadingKeys.isNotEmpty
                  ? Stack(
                children: vm.store.state.ui.loadingKeys.keys.map((LoadingKeys key) {
                  if (vm.store.state.ui.loadingKeys[key]) {
                    return Loader().addLoader(key);
                  } else return EmptyWidget();
                }).toList(),
              )
                  : EmptyWidget(),
              vm.store.state.ui.dialogDisplays != null &&
                  vm.store.state.ui.dialogDisplays.isNotEmpty
                  ? Stack(
                children: vm.store.state.ui.dialogDisplays.map((DialogDisplay dialog) {
                  Future.delayed(Duration(seconds: 2), vm.hideDialog);
                  return SmallDialog(dialog);
                }).toList(),
              )
                  : EmptyWidget(),
            ],
          );
        },
      ),
    );
  }
}


class SmallDialog extends StatelessWidget {
  final DialogDisplay dialog;

  SmallDialog(this.dialog);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width:  double.infinity,
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment:  MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(32.0),
            decoration: BoxDecoration(
              color: white,
              border: Border.all(
                color: white,
              ),
              borderRadius: BorderRadius.circular(4.0),
              boxShadow: [
                BoxShadow(
                  color: black.withOpacity(0.15),
                  blurRadius: 15,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Container(
              margin: EdgeInsets.all(16.0),
              child: Text(
                dialog.message ?? '',
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
