import 'package:flutter/material.dart';

class RouteType {
  static PageRoute defaultRoute({@required RouteSettings settings, @required Widget page}) {
    return MaterialPageRoute(
      settings: settings,
      builder: (BuildContext context) => page,
    );
  }
}
