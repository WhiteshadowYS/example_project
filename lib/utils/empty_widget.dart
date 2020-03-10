import 'package:flutter/material.dart';

/// Used to easily create an empty zero sized without writing all the code over
/// and over
class EmptyWidget extends StatelessWidget {
  const EmptyWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(height: 0, width: 0);
  }
}
