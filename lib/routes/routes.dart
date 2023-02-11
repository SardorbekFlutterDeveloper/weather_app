import 'dart:js';

import 'package:flutter/material.dart';
import 'package:ob_havo_app/views/home_page.dart';

class Routes {
  static final Routes _instance = Routes._init();
  static Routes get instance => _instance;
  Routes._init();

  Routes? onGenerateRoute(RouteSettings settings) {
    var args = settings.arguments;

    switch (settings.name) {
      case "/home":
        return simpleRoute(const HomePage());

      default:
        return simpleRoute(Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
          ),
        ));
    }
  }

  simpleRoute(Widget route) => MaterialPageRoute(builder: (context) => route);
}
