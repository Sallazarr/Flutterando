import 'package:busca_cep/app/components/address_input.dart';
import 'package:busca_cep/app/controllers/home_controller.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final controller = HomeController();

  final cepEC = TextEditingController();
  final ruaEC = TextEditingController();
  final bairroEC = TextEditingController();
  final cidadeEC = TextEditingController();
  final ufEC = TextEditingController();
  final dddEC = TextEditingController();

  Future<void> _searchCep() async {
    final success = await controller.search(cepEC.text);

    setState(() {
      if (success) {
        cepEC.text = controller.resultado?.cep ?? '';
        ruaEC.text = controller.resultado?.logradouro ?? '';
        bairroEC.text = controller.resultado?.bairro ?? '';
        cidadeEC.text = controller.resultado?.cidade ?? '';
        ufEC.text = controller.resultado?.uf ?? '';
        dddEC.text = controller.resultado?.ddd ?? '';

        FocusScope.of(context).unfocus();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(controller.erro ?? 'Erro desconhecido'),
            backgroundColor: Colors.red,
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Busca CEP API VIACEP')),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Text(
                  'Busca CEP',
                  style: TextStyle(
                    color: Colors.amberAccent,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 5,
                    decoration: TextDecoration.underline,
                    decorationThickness: 1.5,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Row(
                    children: [
                      SizedBox(height: 100),
                      Expanded(
                        child: AddressInput(label: 'CEP', controller: cepEC),
                      ),
                      SizedBox(width: 10),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: ElevatedButton(
                          onPressed: () {
                            if (!controller.isLoading) {
                              _searchCep();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amberAccent,
                            foregroundColor: Colors.black,

                            padding: const EdgeInsets.all(14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(6),
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
                SizedBox(height: 30),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Visibility(
                    visible: controller.resultado != null,
                    child: Column(
                      children: [
                        AddressInput(
                          label: "Rua",
                          controller: ruaEC,
                          isReadOnly: true,
                        ),
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
                            SizedBox(width: 10),
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
                            SizedBox(width: 10),
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
