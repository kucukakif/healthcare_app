import 'package:flutter/material.dart';
import 'package:healthcare_app/colors.dart';

class AppTheme {
  const AppTheme();

  static TextStyle titleStyle =
      const TextStyle(color: LightColor.titleTextColor, fontSize: 16);
  static TextStyle subTitleStyle =
      const TextStyle(color: LightColor.subTitleTextColor, fontSize: 12);

  static double fullWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
}
