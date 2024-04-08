import 'package:flutter/material.dart';

class OrientationHelper {
  static Orientation getOrientation(BuildContext context) {
    return MediaQuery.of(context).orientation;
  }

  static bool isPortrait(BuildContext context) {
    return getOrientation(context) == Orientation.portrait;
  }
}
