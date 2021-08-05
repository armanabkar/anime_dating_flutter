import 'package:flutter/material.dart';

import 'utils/colors.dart';
import 'utils/constants.dart';

ThemeData buildThemeData() {
  final baseTheme = ThemeData(fontFamily: K.primaryFont);

  return baseTheme.copyWith(
      primaryColor: primaryColor,
      accentColor: primaryColor,
      scaffoldBackgroundColor: scaffoldColor,
      appBarTheme: AppBarTheme(color: appBarColor));
}
