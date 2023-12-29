import 'package:flutter/material.dart';
import '../../../constants/colors.dart';
import '../../../constants/size.dart';

class TOutlineButtonTheme {
  TOutlineButtonTheme._();

  static final LightOutlineButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(),
      foregroundColor: tSecondaryColor,
      side: BorderSide(color: tSecondaryColor),
      padding: EdgeInsets.symmetric(vertical: tButtontSize),
    ),
  );

  static final DarkOutlineButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(),
      foregroundColor: tWhiteColor,
      side: BorderSide(color: tWhiteColor),
      padding: EdgeInsets.symmetric(vertical: tButtontSize),
    ),
  );
}
