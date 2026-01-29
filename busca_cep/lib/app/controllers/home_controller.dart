import 'package:busca_cep/app/models/cep_model.dart';
import 'package:dio/dio.dart';

class HomeController {
  // Váriaveis de Estado

  //Guarda o endereço, começa vazio
  CepModel? resultado;

  //guarda a mensagem de erro caso ocorra
  String? erro;

  //diz se o DIO está trabalhando
  bool isLoading = false;

  Future<bool> search(String cep) async {
    isLoading = true;
    erro = null;
    resultado = null;

    try {
      String cleanCep = cep.replaceAll(RegExp(r'[^0-9]'), '');
      if (cleanCep.length != 8) {
        erro = "CEP inválido! Digite 8 números.";
        isLoading = false;
        return false;
      }

      final dio = Dio();
      final url = 'https://viacep.com.br/ws/$cleanCep/json/';
      final response = await dio.get(url);

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
