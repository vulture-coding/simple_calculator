import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


ThemeData darkTheme () => ThemeData(
  primarySwatch: Colors.blue,
  brightness: Brightness.dark,
);
ThemeData lightTheme () => ThemeData(
  primarySwatch: Colors.amber,
  brightness: Brightness.light,
);



TextStyle customFontStyle({double? size, bool? lobster}) {
  double fontSize = size ?? 50;
  double letterSpacing = fontSize / 5;

  if (lobster ?? true) {
    return GoogleFonts.lobster(
      fontSize: fontSize,
      letterSpacing: letterSpacing,
      shadows: [
        Shadow(
          color: Colors.grey,
          offset: Offset(fontSize / 25, fontSize / 25),
          blurRadius: fontSize / 30,
        ),
      ],
      fontWeight: FontWeight.bold,
    );
  } else {
    return TextStyle(
      fontSize: fontSize,
      letterSpacing: letterSpacing,
      shadows: [
        Shadow(
          color: Colors.grey,
          offset: Offset(fontSize / 25, fontSize / 25),
          blurRadius: fontSize / 30,
        ),
      ],
      fontWeight: FontWeight.bold,
    );
  }
}