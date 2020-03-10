import 'package:example_project/theme/colors.dart';
import 'package:example_project/utils/dynamic_size.dart';
import 'package:flutter/material.dart';

class SplashScreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Container(
        width:  double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment:  MainAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              height: getScreenHeight(64, context),
              width:  getScreenHeight(64, context),
              child: CircularProgressIndicator(),
            ),
          ],
        ),
      ),
    );
  }
}
