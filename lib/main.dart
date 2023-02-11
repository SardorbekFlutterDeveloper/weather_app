import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:ob_havo_app/views/home_page.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData(
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSwatch(
                primarySwatch: Colors.purple, backgroundColor: Colors.blue)
            .copyWith(secondary: Colors.amber),
      ),
      dark: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.purple,
        colorScheme: ColorScheme.fromSwatch(
                primarySwatch: Colors.purple, backgroundColor: Colors.blue)
            .copyWith(secondary: Colors.amber),
      ),
      initial: AdaptiveThemeMode.light,
      builder: (theme, darkTheme) => MaterialApp(
        title: 'Adaptive Theme Demo',
        theme: theme,
        debugShowCheckedModeBanner: false,
        darkTheme: darkTheme,
        home: HomePage(),
      ),
    );
  }
}
