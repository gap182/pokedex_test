import 'package:flutter/material.dart';
import 'package:pokemon_test/src/core/theme/colors.dart';

final themeData = ThemeData(
  primaryColor: UiColors.primaryColor,
  colorScheme: const ColorScheme.light(
    primary: UiColors.primaryColor,
    secondary: UiColors.secondaryColor,
  ),
  fontFamily: "Lato",
);
