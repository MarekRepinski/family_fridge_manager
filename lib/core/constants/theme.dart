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

  TextTheme _bascicTextTheme(TextTheme base) {
    return base.copyWith(
      headline1: base.headline1!.copyWith(
        fontFamily: 'Work Sans',
        fontSize: 22.0,
        fontWeight: FontWeight.bold,
        color: Color(colorDark),
      ),
      headline2: base.headline2!.copyWith(
        fontFamily: 'Work Sans',
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
        color: Color(colorBlack),
      ),
      subtitle1: base.subtitle1!.copyWith(
        fontFamily: 'Work Sans',
        fontSize: 15.0,
        fontWeight: FontWeight.normal,
        color: Color(colorBlack),
      ),
      bodyText1: base.bodyText1!.copyWith(
        fontFamily: 'Tajawal',
        fontSize: 12.0,
        fontWeight: FontWeight.normal,
        color: Color(colorBlack),
      ),
      caption: base.caption!.copyWith(
        fontFamily: 'Tajawal',
        fontSize: 12.0,
        fontWeight: FontWeight.bold,
        color: Color(colorBlack),
      ),
      button: base.button!.copyWith(
        fontFamily: 'Tajawal',
        fontSize: 15.0,
        fontWeight: FontWeight.bold,
        color: Color(colorWhite),
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