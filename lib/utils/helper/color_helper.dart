import 'package:flutter/material.dart';
import 'package:flutter_base/constants/app_enums.dart';

class ColorHelpers {
  static int fromHexString(String argbHexString) {
    String useString = argbHexString;
    if (useString.startsWith("#")) {
      useString = useString.substring(1); // trim the starting '#'
    }
    if (useString.length < 8) {
      useString = "FF" + useString;
    }
    if (!useString.startsWith("0x")) {
      useString = "0x" + useString;
    }
    return int.parse(useString);
  }

  static final double _kMinContrastModifierRange = 0.35;
  static final double _kMaxContrastModifierRange = 0.65;

  static Color blackOrWhiteContrastColor(Color sourceColor,
      {ContrastPreference prefer = ContrastPreference.none}) {
    // Will return a value between 0.0 (black) and 1.0 (white)
    double value = (((sourceColor.red * 299.0) +
        (sourceColor.green * 587.0) +
        (sourceColor.blue * 114.0)) /
        1000.0) /
        255.0;
    if (prefer != ContrastPreference.none) {
      if (value >= _kMinContrastModifierRange &&
          value <= _kMaxContrastModifierRange) {
        return prefer == ContrastPreference.light
            ? Color(0xFFFFFFFF)
            : Color(0xFF000000);
      }
    }
    return value > 0.6 ? Color(0xFF000000) : Color(0xFFFFFFFF);
  }
}
