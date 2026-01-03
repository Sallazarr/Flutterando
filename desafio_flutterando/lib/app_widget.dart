import 'package:desafio_flutterando/login_tinder.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.red),
      initialRoute: '/',
      routes: {'/': (context) => LoginTinder()},
    );
  }
}
