

import 'package:flutter/material.dart';
import 'package:ob_havo_app/views/home_page.dart';



class Routes {
  static final Routes _instance = Routes._init();
  static Routes get instance => _instance;
  Routes._init();

  Route? onGenerateRoute(RouteSettings settings) {
    final Object? args = settings.arguments;

    switch (settings.name) {
         case "/home":
        return simpleRoute(const HomePage());
    
      
    }
    return null;
  }


   simpleRoute(Widget route) => MaterialPageRoute(builder: (context) => route);
}