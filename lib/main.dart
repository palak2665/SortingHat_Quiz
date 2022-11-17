import 'package:flutter/material.dart';

import 'utils/routes.dart';
import 'widgets/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyTheme.lightTheme(context),
      onGenerateRoute: MyRoutes.onGenerateRoute,
    );
  }
}
