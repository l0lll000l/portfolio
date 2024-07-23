import 'package:Portfolio/Utils/Theme/customTheme/appBArTheme.dart';
import 'package:Portfolio/Utils/Theme/customTheme/bottomSheet.dart';
import 'package:Portfolio/Utils/Theme/customTheme/checkboxTheme.dart';
import 'package:Portfolio/Utils/Theme/customTheme/chipThemeData.dart';
import 'package:Portfolio/Utils/Theme/customTheme/elevatedButtonTheme.dart';
import 'package:Portfolio/Utils/Theme/customTheme/textFieldTheme.dart';
import 'package:Portfolio/Utils/Theme/customTheme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TAppTheme {
  TAppTheme._();
  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      fontFamily: GoogleFonts.outfit().fontFamily,
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      textTheme: TTextTheme.darkTheme, //// text color change
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: TAppBarTheme.lightAppBarTheme,
      bottomSheetTheme: TBottomSheetTheme.light,
      checkboxTheme: TCheckBoxTheme.light,
      chipTheme: TChipTheme.light,
      inputDecorationTheme: TTextfieldTheme.dark,

      /// textformfield color change
      elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme);
  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'popins',
      brightness: Brightness.dark,
      primaryColor: Colors.blue,
      textTheme: TTextTheme.darkTheme,
      scaffoldBackgroundColor: Colors.black,
      appBarTheme: TAppBarTheme.blackAppBarTheme,
      bottomSheetTheme: TBottomSheetTheme.Dark,
      checkboxTheme: TCheckBoxTheme.Dark,
      chipTheme: TChipTheme.Dark,
      inputDecorationTheme: TTextfieldTheme.dark,
      elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButton);
}
