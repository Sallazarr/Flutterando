import 'package:busca_cep_api/app/views/home_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Busca CEP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Define o Amber como cor semente para detalhes do sistema
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        useMaterial3: false,
      ),
      home: const HomeView(),
    );
  }
}
