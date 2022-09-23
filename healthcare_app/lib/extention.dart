import 'package:flutter/material.dart';
import 'colors.dart';

extension TextStyleHelpers on TextStyle {
  TextStyle get subTitleColor => copyWith(color: LightColor.subTitleTextColor);
}

extension PaddingHelper on Widget {
  /// Set padding according to `value`
  Padding p(double value) =>
      Padding(padding: EdgeInsets.all(value), child: this);
}
