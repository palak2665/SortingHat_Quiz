import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hogwaarts_quiz/screens/home_page.dart';
import 'package:hogwaarts_quiz/screens/house_details.dart';
import 'package:hogwaarts_quiz/screens/result_page.dart';

class MyRoutes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/splash':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/home':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case '/housedetails':
        return MaterialPageRoute(builder: (_) => HouseDetails());
      case '/result':
        return MaterialPageRoute(builder: (_) => ResultPage());
      default:
        return MaterialPageRoute(builder: (_) => HomePage());
    }
  }
}
