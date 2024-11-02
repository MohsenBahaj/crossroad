import 'package:crossroad/utils/constants/colors.dart';
import 'package:crossroad/utils/theme/custom/appbar_theme.dart';
import 'package:crossroad/utils/theme/custom/bottom_sheet.theme.dart';
import 'package:crossroad/utils/theme/custom/checkbox_theme.dart';
import 'package:crossroad/utils/theme/custom/chip_theme.dart';
import 'package:crossroad/utils/theme/custom/elevated_button_theme.dart';
import 'package:crossroad/utils/theme/custom/outlined_button_theme.dart';
import 'package:crossroad/utils/theme/custom/text_field_theme.dart';
import 'package:crossroad/utils/theme/custom/text_theme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TextThemeClass.lightTextTheme,
    elevatedButtonTheme: ElevatedButtonThemeClass.lightElevatedButtonTheme,
    chipTheme: ChipThemeClass.lightChipTheme,
    appBarTheme: AppBarThemeClass.lightAppBarTheme,
    checkboxTheme: CheckBoxThemeClass.lightCheckBoxTheme,
    bottomSheetTheme: BottomSheetThemeClass.lightBottomSheetTheme,
    outlinedButtonTheme: OutlinedButtonThemeClass.lightOutlinedButtonTheme,
    inputDecorationTheme: TextFieldThemeClass.lightInputDecorationTheme,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    textTheme: TextThemeClass.darkTextTheme,
    elevatedButtonTheme: ElevatedButtonThemeClass.darkElevatedButtonTheme,
    chipTheme: ChipThemeClass.darkChipTheme,
    appBarTheme: AppBarThemeClass.darkAppBarTheme,
    checkboxTheme: CheckBoxThemeClass.darkCheckBoxTheme,
    bottomSheetTheme: BottomSheetThemeClass.darkBottomSheetTheme,
    outlinedButtonTheme: OutlinedButtonThemeClass.darkoutlinedButtonTheme,
    inputDecorationTheme: TextFieldThemeClass.darkInputDecorationTheme,
  );
}
