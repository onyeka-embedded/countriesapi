import 'package:flutter/material.dart';

class Themes {
   static final light = ThemeData(
     scaffoldBackgroundColor: const Color(0xFFFFFFFF),
      primaryColor: Colors.white,
      brightness: Brightness.light,
       colorScheme: ThemeData().colorScheme.copyWith(
          secondary: Colors.white, 
            brightness: Brightness.light,
          ),
          iconTheme: IconThemeData(
            color: Colors.black,
          )
      );

  static final dark = ThemeData(
      scaffoldBackgroundColor: const Color(0xFF000F24),
      primaryColor: const Color(0xFF000F24),
      brightness: Brightness.dark,
      colorScheme: ThemeData().colorScheme.copyWith(
          secondary: const Color(0xFF000F24), 
            brightness: Brightness.dark,
          ),
           iconTheme: IconThemeData(
            color: Color(0xFFEAECF0),
          )
      );
}
