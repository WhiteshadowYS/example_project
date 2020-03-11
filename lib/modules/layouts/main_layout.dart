import 'package:flutter/material.dart';
import 'package:example_project/modules/layouts/dialog_layout/dialog_layout.dart';
import 'package:example_project/theme/colors.dart';

class MainLayout extends StatelessWidget {
  final Widget child;

  MainLayout({this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Container(
        padding: EdgeInsets.all(16),
        width:  double.infinity,
        height: double.infinity,
        child: Stack(
          children: <Widget>[
            child,
            DialogLayout(),
          ],
        ),
      ),
    );
  }
}
