import 'package:desafio_flutterando/home_page.dart';
import 'package:desafio_flutterando/login_tinder.dart';
import 'package:desafio_flutterando/select_login.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      initialRoute: '/',
      routes: {
        '/': (context) => SelectLoginTinder(),
        '/login': (context) => LoginTinder(),
        '/home': (context) => HomePage(),
      },
    );
  }
}
