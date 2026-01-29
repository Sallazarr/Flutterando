import 'package:dio/dio.dart';
import '../models/cep_model.dart';

class HomeController {
  // Variáveis de Estado
  CepModel? resultado;
  String? erro;
  bool isLoading = false;

  Future<bool> search(String cep) async {
    isLoading = true;
    erro = null;
    resultado = null;

    try {
      // Limpeza para a API (remove traços e pontos)
      String cleanCep = cep.replaceAll(RegExp(r'[^0-9]'), '');

      if (cleanCep.length != 8) {
        erro = "CEP inválido! Digite 8 números.";
        isLoading = false;
        return false;
      }

      final dio = Dio();
      final url = 'https://viacep.com.br/ws/$cleanCep/json/';

      final response = await dio.get(url);

      // Tratamento do "Sucesso Falso" do ViaCep
      if (response.data['erro'] == true) {
        erro = 'Este CEP não existe';
        isLoading = false;
        return false;
      }

      resultado = CepModel.fromJson(response.data);
      isLoading = false;
      return true;
    } catch (e) {
      print(e);
      erro = 'Erro ao buscar CEP, verifique sua internet.';
      isLoading = false;
      return false;
    }
  }
}
