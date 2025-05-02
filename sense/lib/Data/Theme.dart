import 'package:flutter/material.dart';

const Color primary = Color(0xff264653);
const Color secondary= Color(0xff17C3B2);
const Color ternary  = Color(0xffFFCB77);
const Color quaternary = Color(0xffFEF9EF);
const Color fith=Color(0xffFE6D73);
const Color error=Color(0xffD44148);
const Color textcolour= primary;
const Color iconcolor=Color(0xffABABAB);

const textTheme = TextTheme(
  
  displayLarge: TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.w400,

    color: textcolour,
  ),
  displayMedium: TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.w400,
    color: textcolour,
  ),
  displaySmall: TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w500,
    color: textcolour,
  ),
  bodyLarge: TextStyle(
    fontFamily: 'Poppins-SemiBoldr',
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: textcolour,
  ),
  bodyMedium: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: textcolour,
  ),
  bodySmall: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: quaternary,
  ),
  labelLarge: TextStyle(
    fontSize: 9,
    fontWeight: FontWeight.w400,
    color: quaternary,
  ),
  labelMedium: TextStyle(
    fontSize: 9,
    fontWeight: FontWeight.w400,
    color: textcolour,
  ),
  labelSmall: TextStyle(
    fontSize: 5,
    fontWeight: FontWeight.w400,
    color: quaternary,
  ),
);

final ThemeData lightTheme = ThemeData(
  fontFamily: 'Poppins',
  useMaterial3: true,
  textTheme: textTheme,
  colorScheme: ColorScheme.fromSeed(
    seedColor: primary,
    primary: primary,
    onPrimary: quaternary,
    secondary: secondary,
    onSecondary: textcolour,
    surface: quaternary,
    onSurface: textcolour,
    error: error,
    onError: ternary,
    tertiary: fith,
    onTertiary: textcolour,
    brightness: Brightness.light,
  ),
  primaryColor: primary,
  cardTheme: CardTheme(
    margin: EdgeInsets.all(4),
    color: quaternary,
  ),
  dividerColor: textcolour.withValues(alpha:0.4), 
  hintColor: textcolour.withValues(alpha: 0.6),
  indicatorColor: secondary,
  secondaryHeaderColor: quaternary,
  focusColor: fith,
  shadowColor: textcolour.withValues(alpha: .3),
  iconTheme: IconThemeData(color: primary),
  primaryTextTheme: textTheme
);
