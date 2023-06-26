import 'package:first_app/card_page.dart';
import 'package:first_app/form_page.dart';
import 'package:first_app/home_page.dart';
import 'package:first_app/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: CardPage(),
      // home: HomePage(),
      home: FormPage(),
      routes: Routes().routes,
    );
  }
}
