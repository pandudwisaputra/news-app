import 'package:flutter/material.dart';

const Color lightScaffoldColor = Color(0xffFAFAFA);
const Color darkScaffoldColor = Color(0xff1A1A1A);
const Color darkCardColor = Color(0xff292D32);
const Color primaryColor = Color(0xffED1B23);
const Color fontWhiteColor = Color(0xffDADADA);
const Color fontGreyColor = Color(0xff9A9A9A);
const Color fontGreyColor2 = Color(0xffA0A0A0);

const interWhiteTextStyle = TextStyle(
  fontFamily: 'Inter',
  color: fontWhiteColor,
);

const interWhiteTextStyle2 = TextStyle(
  fontFamily: 'Inter',
  color: Colors.white,
);

const interGreyTextStyle = TextStyle(
  fontFamily: 'Inter',
  color: fontGreyColor2,
);

ThemeData lightMode = ThemeData(
  scaffoldBackgroundColor: lightScaffoldColor,
  cardColor: lightScaffoldColor,
  hintColor: Colors.grey.shade300,
  focusColor: Colors.grey.shade100,
  appBarTheme: const AppBarTheme(
    backgroundColor: lightScaffoldColor,
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      fontFamily: 'Inter',
      color: Colors.black,
    ),
    bodyMedium: TextStyle(
      fontFamily: 'Inter',
      color: Colors.black,
    ),
    bodySmall: TextStyle(
      fontFamily: 'Inter',
      color: Colors.black,
    ),
  ),
  colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
  useMaterial3: true,
);

ThemeData darkMode = ThemeData(
  scaffoldBackgroundColor: darkScaffoldColor,
  cardColor: darkCardColor,
  hintColor: const Color(0xff333333),
  focusColor: const Color(0xff666666),
  appBarTheme: const AppBarTheme(
    backgroundColor: darkScaffoldColor,
  ),
  textTheme: const TextTheme(
      bodyLarge: TextStyle(
        fontFamily: 'Inter',
        color: fontWhiteColor,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'Inter',
        color: fontGreyColor,
      ),
      bodySmall: interWhiteTextStyle2),
  colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
  useMaterial3: true,
);
