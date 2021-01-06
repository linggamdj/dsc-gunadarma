import 'package:flutter/material.dart';
import 'package:week_1/splash_page.dart';

void main() {
  runApp(MyApp());
}

// deklarasi class (shortcut stl -> tab)
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //property
      home: SplashPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
