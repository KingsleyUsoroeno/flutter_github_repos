import 'package:flutter/material.dart';
import 'package:provider_architecture/ui/home_screen.dart';

import 'core/locator.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

/// Please check the router.dart file to understand Navigation on the App*/
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: HomeScreen(),
    );
  }
}
