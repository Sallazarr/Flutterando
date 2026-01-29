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
        cursorColor: Colors.amberAccent, // 1. A barrinha que pisca fica Amarela
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(
            color: Colors.black54, // Cor do texto quando não está focado
          ),
          // O Flutter usa esse estilo quando o campo está focado (label flutuando)
          floatingLabelStyle: const TextStyle(
            color: Colors.amber,
            fontWeight: FontWeight.bold,
          ),

          isDense: true,

          // 2. Borda quando o campo está quieto (sem foco)
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 230, 230, 230),
            ),
          ),

          // 3. Borda quando você clica para digitar (Foco)
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.amber, // BRILHO AMARELO!
              width: 2.0, // Fica mais grossinha
            ),
          ),

          // 4. Borda padrão (fallback)
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
