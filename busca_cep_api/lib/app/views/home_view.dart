import 'package:flutter/material.dart';
import '../controllers/home_controller.dart';
import '../components/address_input.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final controller = HomeController();

  // Controllers de Texto
  final cepEC = TextEditingController();
  final ruaEC = TextEditingController();
  final bairroEC = TextEditingController();
  final cidadeEC = TextEditingController();
  final ufEC = TextEditingController();
  final dddEC = TextEditingController();

  Future<void> _searchCep() async {
    // Esconde o teclado antes de começar
    FocusScope.of(context).unfocus();

    // Atualiza para mostrar loading
    setState(() {});

    final success = await controller.search(cepEC.text);

    setState(() {
      if (success) {
        // Preenche todos os campos com os dados da API
        cepEC.text = controller.resultado?.cep ?? ''; // Formata o CEP com traço
        ruaEC.text = controller.resultado?.logradouro ?? '';
        bairroEC.text = controller.resultado?.bairro ?? '';
        cidadeEC.text = controller.resultado?.cidade ?? '';
        ufEC.text = controller.resultado?.uf ?? '';
        dddEC.text = controller.resultado?.ddd ?? '';
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              controller.erro ?? 'Erro desconhecido',
              style: const TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.redAccent,
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 46, 46, 46), // Fundo Dark
      appBar: AppBar(
        title: const Text(
          'Busca CEP',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.amberAccent, // Topo Amarelo
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 20),

              const Text(
                'Insira seu CEP abaixo',
                style: TextStyle(
                  color: Colors.amberAccent,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),

              const SizedBox(height: 30),

              // --- ÁREA DE BUSCA (Alinhada perfeitamente) ---
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: IntrinsicHeight(
                  // Iguala altura do botão e do input
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: AddressInput(label: 'CEP', controller: cepEC),
                      ),
                      const SizedBox(width: 10),

                      // Padding no botão para alinhar com o input que tem margem oculta
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: ElevatedButton(
                          onPressed: () {
                            if (!controller.isLoading) {
                              _searchCep();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amberAccent,
                            foregroundColor: Colors.black,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: controller.isLoading
                              ? const SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    color: Colors.black,
                                    strokeWidth: 2,
                                  ),
                                )
                              : const Icon(Icons.search),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // --- ÁREA DE RESULTADO (Só aparece se tiver dado) ---
              Visibility(
                visible: controller.resultado != null,
                child: Column(
                  children: [
                    // 1. Rua (Linha inteira)
                    AddressInput(
                      label: "Rua",
                      controller: ruaEC,
                      isReadOnly: true,
                    ),

                    // 2. Bairro + DDD (Proporção 3 pra 1)
                    Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: AddressInput(
                            label: 'Bairro',
                            controller: bairroEC,
                            isReadOnly: true,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          flex: 1,
                          child: AddressInput(
                            label: 'DDD',
                            controller: dddEC,
                            isReadOnly: true,
                          ),
                        ),
                      ],
                    ),

                    // 3. Cidade + UF (Proporção 3 pra 1)
                    Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: AddressInput(
                            label: 'Cidade',
                            controller: cidadeEC,
                            isReadOnly: true,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          flex: 1,
                          child: AddressInput(
                            label: 'UF',
                            controller: ufEC,
                            isReadOnly: true,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
