import 'package:flutter/material.dart';
import 'package:gatey/src/pages/home/index.dart';
import 'package:gatey/src/pages/login/index.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch(settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case '/dashboard':
         return MaterialPageRoute(builder: (_) => HomeScreen());
      default:
        return MaterialPageRoute(builder: (context) => const Scaffold(
          body: SizedBox(
            child: Center(
              child: Text('Default Page'),
            ),
          ),
        ));
    }
  }
}