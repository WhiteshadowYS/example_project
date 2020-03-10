import 'package:flutter/material.dart';

///the sizes that the initial design was built in.
const double DESIGN_SCREEN_WIDTH   = 360;
const double DESIGN_SCREEN_HEIGHT  = 640;

/// Used to treat the sizes from the design as percentage of the
/// screen, to allow for better sizing on different sizes of screens.
///
/// Calculates the percentage that is the [initialSize] from the
/// [DESIGN_SCREEN_WIDTH] or [DESIGN_SCREEN_HEIGHT] (chosen based on [isHeight])
/// and returns the value of that percentage from the actual screen dimension.

Size getScreenSize(BuildContext context) {
  return Size(
    MediaQuery.of(context).size.width,
    MediaQuery.of(context).size.height,
  );
}



Size getPhotoBlockSize(BuildContext context) {
  double appBarHeight     = 44;
  double bottomBarHeight  = getScreenHeight(110, context);

  Size screenSize = getScreenSize(context);

  return Size(
    screenSize.width,
    screenSize.height - appBarHeight - bottomBarHeight,
  );
}

double getScreenHeight(double value, BuildContext context)
  => MediaQuery.of(context).size.height * (value / DESIGN_SCREEN_HEIGHT);

double getScreenWidth(double value, BuildContext context)
  => MediaQuery.of(context).size.width * (value / DESIGN_SCREEN_WIDTH);

double getDynamicSizeForContext({double initialSize, BuildContext context, bool isHeight = false}) {
  if (isHeight) {
    return MediaQuery.of(context).size.height * (initialSize / DESIGN_SCREEN_HEIGHT);
  } else {
    return MediaQuery.of(context).size.width * (initialSize / DESIGN_SCREEN_WIDTH);
  }
}
