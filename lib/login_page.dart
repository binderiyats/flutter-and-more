import 'package:first_app/register_page.dart';
import 'package:first_app/routes.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  void onRegisterPage(BuildContext context) {
    Navigator.popAndPushNamed(context, "register");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login page")),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () => onRegisterPage(context),
              child: Text("Register Page")),
          Text("Login Page")
        ],
      )),
    );
  }
}
