import 'package:flutter/material.dart';
import 'package:trail2/src/utils/theme/widget_theme/elevatedburron_theme.dart';
import 'package:trail2/src/utils/theme/widget_theme/outlinebutton_theme.dart';
import 'package:trail2/src/utils/theme/widget_theme/text_theme.dart';
import 'package:trail2/src/utils/theme/widget_theme/textfeild_theme.dart';

class TAppTheme {
  TAppTheme._(); //private constructor

  static ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.yellow,
    brightness: Brightness.light,
    textTheme: TTextTheme.lightTextTheme,
    appBarTheme: AppBarTheme(),
    outlinedButtonTheme: TOutlineButtonTheme.LightOutlineButtonTheme,
    floatingActionButtonTheme: FloatingActionButtonThemeData(),
    elevatedButtonTheme: TElevatedButtonTheme.LightElevatedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
  );

  static ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.yellow,
    brightness: Brightness.dark,
    textTheme: TTextTheme.darkTextTheme,
    appBarTheme: AppBarTheme(),
    outlinedButtonTheme: TOutlineButtonTheme.DarkOutlineButtonTheme,
    floatingActionButtonTheme: FloatingActionButtonThemeData(),
    elevatedButtonTheme: TElevatedButtonTheme.DarkElevatedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
  );
}
