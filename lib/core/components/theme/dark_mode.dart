import 'package:flutter/services.dart';

import '../template.dart';

class DarkTheme {
static ThemeData darkTheme = ThemeData(
    appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF191C1F),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
          statusBarColor: Color(0xFF191C1F),
        )),
    useMaterial3: true,
    splashColor: const Color(0xFF191C1F),
    hintColor: Colors.grey,
    cardColor: const Color(0XFF005ACE),
    scaffoldBackgroundColor: const Color(0xFF001A47),
    primaryColor: Colors.white,
    colorScheme: const ColorScheme.dark(),
    primaryColorDark: const Color(0xFF536872),
    shadowColor: Colors.grey.shade500,
    textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.white),
    textTheme: TextTheme(
      headline1: const TextStyle(color: Color(0xFFFFFFFF),fontSize: 90,fontWeight: FontWeight.bold),
      headline2: const TextStyle(color: Color(0XFFFFFFFF),fontSize: 40,fontWeight: FontWeight.bold),
      headline3: const TextStyle(color: Color(0XFFFFFFFF),fontSize: 60,fontWeight: FontWeight.w300),
      headline4: const TextStyle(color: Color(0XFFFFFFFF),fontSize: 80,fontWeight: FontWeight.w300),
      headline5: const TextStyle(color: Color(0XFFFFFFFF),fontSize: 35,fontWeight: FontWeight.normal),
      headline6: TextStyle(color: Colors.white.withOpacity(0.8)),
    ),
  );
}


