import 'package:flutter/material.dart';

final gCyanTheme = ThemeData(primarySwatch: CustomColors.cust(0xff546e7a)).copyWith();

const kApiKey = 'ba57161705fe2322386279881acfa77d';

class CustomColors {
  static MaterialColor cust(int colorInt) => MaterialColor(
        colorInt,
        <int, Color>{
          50: Color(colorInt),
          100: Color(colorInt),
          200: Color(colorInt),
          300: Color(colorInt),
          400: Color(colorInt),
          500: Color(colorInt),
          600: Color(colorInt),
          700: Color(colorInt),
          800: Color(colorInt),
          900: Color(colorInt),
        },
      );
}

const gTextStyleLocation = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w700,
);

TextStyle kTextStyleControllButton() => TextStyle(
      color: gCyanTheme.cardColor,
      fontSize: 16,
      fontWeight: FontWeight.w600,
      shadows: List.generate(3, (index) {
        return Shadow(color: Color(0xFF000000), blurRadius: 7);
      }),
    );

const kSizeIconSmall = 18.0;
const kSizeIconLage = 20.0;
