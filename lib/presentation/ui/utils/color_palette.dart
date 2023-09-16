import 'package:flutter/material.dart';

Color customColor = const Color.fromARGB(255, 88, 135, 255);
MaterialColor customSwatch = MaterialColor(
  customColor.value,
  <int, Color>{
    50: customColor.withOpacity(0.1),
    100: customColor.withOpacity(0.2),
    200: customColor.withOpacity(0.3),
    300: customColor.withOpacity(0.4),
    400: customColor.withOpacity(0.5),
    500: customColor.withOpacity(0.6),
    600: customColor.withOpacity(0.7),
    700: customColor.withOpacity(0.8),
    800: customColor.withOpacity(0.9),
    900: customColor.withOpacity(1.0),
  },
);
