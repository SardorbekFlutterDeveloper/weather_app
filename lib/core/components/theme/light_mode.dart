import 'package:flutter/services.dart';

import '../template.dart';

class LightTheme {
 static ThemeData lightTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFFFFFFFF),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Color(0xFFCFD5DE),
      ),
    ),
    hintColor: Colors.grey,
    scaffoldBackgroundColor: const Color(0xFFFFFFFF),
    colorScheme: const ColorScheme.light(),
    primaryColorDark: const Color(0xFFCFD5DE),
    primaryColor: const Color(0xFF0465DA),
    useMaterial3: true,
    cardColor: const Color(0xFF0A62CE),
    shadowColor: Colors.grey.shade300,
    textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.black),
    splashColor: Colors.grey.shade300,
    textTheme: TextTheme(
      headline1: const TextStyle(color: Color(0xFF0465DA),fontSize: 90,fontWeight: FontWeight.bold),
      headline2: const TextStyle(color: Color(0XFF717171),fontSize: 40,fontWeight: FontWeight.bold),
      headline3: const TextStyle(color: Color(0XFF717171),fontSize: 60,fontWeight: FontWeight.w300),
      headline4: const TextStyle(color: Color(0XFF000000),fontSize: 80,fontWeight: FontWeight.w300),
      headline5: const TextStyle(color: Color(0XFF000000),fontSize: 35,fontWeight: FontWeight.normal),
      headline6: TextStyle(color: Colors.black.withOpacity(0.8)),
    ),
  );
}
