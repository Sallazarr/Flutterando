import 'package:busca_cep/app/views/home_view.dart';
import 'package:flutter/material.dart';

main() {
  runApp(AppWidget());
}

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(useMaterial3: false),
      home: HomeView(),
    );
  }
}
