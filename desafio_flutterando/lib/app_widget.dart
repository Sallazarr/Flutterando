import 'package:desafio_flutterando/login_tinder.dart';
import 'package:desafio_flutterando/select_login.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.red),
      initialRoute: '/',
      routes: {
        '/': (context) => SelectLoginTinder(),
        '/login': (context) => LoginTinder(),
      },
    );
  }
}
