import 'package:flutter/material.dart';

// 0xFFE9BE9B
// Orange: Contrast color, used for CTA, buttons, other details etc.Can also be
//         used for small texts to be highlighted against the dark purple color.
//
// 0xFF231671
// Dark Purple: Main color, used for bigger blocks as background color along with
//              white. White text is used on top of purple.
//
// 0xFF9B8AFC
// Mid Purple: Secondary color, can be used for icons, highlighting words,
//             illustrations etc.
//
// 0xFFE2DDFC
// Light Purple: Alternative background color, used for specific sections. Alternate
//               with white and dark purple.

ThemeData basicTheme() {
  int colorDark = 0xFF231671;       // Dark Purple
  int colorMid = 0xFF9B8AFC;        // Mid Purple
  int colorLight = 0xFFE2DDFC;      // Light Purple
//  int colorContrast = 0xFFE9BE9B;   // Orange
  int colorWhite = 0xFFE7E7E7;      // Light light grey
  int colorBlack = 0xFF000000;      // Black
  // int colorOpacity = 0x77000000;      // Mid Grey

  TextTheme _bascicTextTheme(TextTheme base) {
    return base.copyWith(
      displayLarge: base.displayLarge!.copyWith(
        fontFamily: 'Lato',
        // fontSize: 22.0,
        // fontWeight: FontWeight.bold,
        color: Color(colorBlack),
      ),
      displayMedium: base.displayMedium!.copyWith(
        fontFamily: 'Lato',
        // fontSize: 22.0,
        // fontWeight: FontWeight.bold,
        color: Color(colorDark),
      ),
      displaySmall: base.displaySmall!.copyWith(
        fontFamily: 'Lato',
        // fontSize: 22.0,
        // fontWeight: FontWeight.bold,
        color: Color(colorDark),
      ),
      headlineLarge: base.headlineLarge!.copyWith(
        fontFamily: 'Lato',
        // fontSize: 22.0,
        // fontWeight: FontWeight.bold,
        color: Color(colorDark),
      ),
      headlineMedium: base.headlineMedium!.copyWith(
        fontFamily: 'Lato',
        // fontSize: 22.0,
        // fontWeight: FontWeight.bold,
        color: Color(colorDark),
      ),
      headlineSmall: base.headlineSmall!.copyWith(
        fontFamily: 'Lato',
        // fontSize: 22.0,
        // fontWeight: FontWeight.bold,
        color: Color(colorDark),
      ),
      titleLarge: base.titleLarge!.copyWith(
        fontFamily: 'Lato',
        // fontSize: 22.0,
        // fontWeight: FontWeight.bold,
        color: Color(colorDark),
      ),
      titleMedium: base.titleMedium!.copyWith(
        fontFamily: 'Lato',
        // fontSize: 22.0,
        fontWeight: FontWeight.bold,
        color: Color(colorDark),
      ),
      titleSmall: base.titleSmall!.copyWith(
        fontFamily: 'Lato',
        // fontSize: 22.0,
        // fontWeight: FontWeight.bold,
        color: Color(colorDark),
      ),
      labelLarge: base.labelLarge!.copyWith(
        fontFamily: 'Lato',
        // fontSize: 22.0,
        // fontWeight: FontWeight.bold,
        color: Color(colorDark),
      ),
      labelMedium: base.labelMedium!.copyWith(
        fontFamily: 'Lato',
        // fontSize: 22.0,
        // fontWeight: FontWeight.bold,
        color: Color(colorDark),
      ),
      labelSmall: base.labelSmall!.copyWith(
        fontFamily: 'Lato',
        // fontSize: 10.0,
        // fontWeight: FontWeight.bold,
        color: Color(colorDark),
      ),
      bodyLarge: base.bodyLarge!.copyWith(
        fontFamily: 'Lato',
        // fontSize: 22.0,
        // fontWeight: FontWeight.bold,
        color: Color(colorDark),
      ),
      bodyMedium: base.bodyMedium!.copyWith(
        fontFamily: 'Lato',
        // fontSize: 22.0,
        // fontWeight: FontWeight.bold,
        color: Color(colorDark),
      ),
      bodySmall: base.bodySmall!.copyWith(
        fontFamily: 'Lato',
        // fontSize: 22.0,
        // fontWeight: FontWeight.bold,
        color: Color(colorDark),
      ),
    );
  }

  AppBarTheme _basicAppBarTheme(AppBarTheme appBase) {
    return appBase.copyWith(
      color: Color(colorLight),
      iconTheme: IconThemeData(color: Color(colorDark)),
      actionsIconTheme: IconThemeData(color: Color(colorDark)),
    );
  }

  final ThemeData base = ThemeData.light();

  return base.copyWith(
      textTheme: _bascicTextTheme(base.textTheme),
      primaryColor: Color(colorMid),
      primaryColorDark: Color(colorDark),
      primaryColorLight: Color(colorLight),
      scaffoldBackgroundColor: Color(colorWhite),
      appBarTheme: _basicAppBarTheme(base.appBarTheme),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        foregroundColor: Color(colorDark),
        backgroundColor: Color(colorLight),
      ),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            primary: Color(colorDark),
          )
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Color(colorMid),
          )
      ),
      primaryIconTheme: IconThemeData(
        color: Color(colorWhite),
      )
  );
}