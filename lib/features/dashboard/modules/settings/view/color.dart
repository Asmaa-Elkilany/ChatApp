import 'package:flutter/material.dart';

ThemeData? activeTheme;

final darkTheme = ThemeData(
  primaryColor: Colors.black,
  colorScheme: ColorScheme.dark(
    primary: Colors.black,
    secondary: Colors.grey,
    surface: Colors.black,
    background: Colors.black,
    error: Colors.red,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: Colors.white,
    onBackground: Colors.white,
    onError: Colors.white,
  ),
  brightness: Brightness.dark,
);

final lightTheme = ThemeData(
  primaryColor: Colors.black12,
  colorScheme: ColorScheme.light(
    primary: Colors.black12,
    secondary: Colors.grey,
    surface: Colors.white,
    background: Colors.white,
    error: Colors.red,
    onPrimary: Colors.black, // Text color on primary background
    onSecondary: Colors.black, // Text color on secondary background
    onSurface: Colors.black, // Text color on surface (background) color
    onBackground: Colors.black, // Text color on background color
    onError: Colors.white, // Text color on error color
    brightness: Brightness.light,
  ),
  brightness: Brightness.light,
);

final purpleTheme = ThemeData(
  primaryColor: Colors.purple,
  primarySwatch: Colors.purple, // If you prefer, you can use primarySwatch instead
  colorScheme: ColorScheme.light(
    primary: Colors.purple,
    secondary: Colors.purpleAccent,
    surface: Colors.white,
    background: Colors.white,
    error: Colors.red,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: Colors.black,
    onBackground: Colors.black,
    onError: Colors.white,
    brightness: Brightness.light,
  ),
  brightness: Brightness.light,
);
