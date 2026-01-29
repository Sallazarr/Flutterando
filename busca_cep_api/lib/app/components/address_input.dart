import 'package:flutter/material.dart';

class AddressInput extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool isReadOnly;

  const AddressInput({
    super.key,
    required this.label,
    required this.controller,
    this.isReadOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextField(
        controller: controller,
        readOnly: isReadOnly,
        cursorColor: Colors.amberAccent, // Cursor Amarelo
        style: const TextStyle(
          color: Colors.white,
        ), // Texto digitado branco (para fundo escuro)
        decoration: InputDecoration(
          labelText: label,

          // Estilo da Label parada
          labelStyle: const TextStyle(color: Colors.white70),

          // Estilo da Label quando focada (Amarela e Negrito)
          floatingLabelStyle: const TextStyle(
            color: Colors.amberAccent,
            fontWeight: FontWeight.bold,
          ),

          isDense: true,

          // Borda padrão (Cinza)
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.white24),
          ),

          // Borda Focada (Brilho Amarelo)
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.amberAccent, width: 2),
          ),

          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
