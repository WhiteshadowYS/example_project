import 'package:flutter/material.dart';

import 'package:example_project/theme/colors.dart';
import 'package:example_project/store/ui/ui_state.dart';
import 'package:example_project/utils/bounce_loader.dart';

class Loader {
  Widget addLoader(LoadingKeys loadingKey) {
    switch (loadingKey) {
      case LoadingKeys.initializeLoading:
        return BasicLoader();
      case LoadingKeys.login:
        return BasicLoader();
      case LoadingKeys.logout:
        return BasicLoader();

      default:
        return BasicLoader();
    }
  }
}

class BasicLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width:  double.infinity,
      color:  background.withOpacity(0.4),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: SpinKitThreeBounce(
              size: 40.0,
              color: primary,
              duration: Duration(seconds: 300),
            ),
          ),
        ],
      ),
    );
  }
}
