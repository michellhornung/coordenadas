import 'package:flutter/material.dart';

class UiConfig {
  UiConfig._();

  static String get title => 'Coord';

  static ThemeData get theme => ThemeData(
      primaryColor: const Color(0xFF536DFE),
      primaryColorDark: const Color(0xFF495DD1),
      primaryColorLight: const Color(0xFFBFC5E3),
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: const Color(0xFF495DD1)),
      appBarTheme: AppBarTheme(
        backgroundColor: const Color(0xFF536DFE),
      ));
}
