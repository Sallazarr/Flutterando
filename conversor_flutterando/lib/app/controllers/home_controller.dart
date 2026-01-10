import 'dart:convert';

import 'package:conversor_flutterando/app/models/currency_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeController {
  late List<CurrencyModel> currencies;

  final TextEditingController fromText;
  final TextEditingController toText;

  late CurrencyModel toCurrency;
  late CurrencyModel fromCurrency;

  HomeController({required this.fromText, required this.toText}) {
    currencies = CurrencyModel.getCurrencies();
    fromCurrency = currencies[0];
    toCurrency = currencies[1];
  }

  Future<void> getData() async {
    try {
      final uri = Uri.parse(
        'https://economia.awesomeapi.com.br/last/USD-BRL,EUR-BRL,BTC-BRL',
      );
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);

        currencies[1] = CurrencyModel(
          name: 'Dolar',
          real: double.parse(json['USDBRL']['bid']),
        );
        currencies[2] = CurrencyModel(
          name: 'Euro',
          real: double.parse(json['EURBRL']['bid']),
        );
        currencies[3] = CurrencyModel(
          name: 'Bitcoin',
          real: double.parse(json['BTCBRL']['bid']),
        );

        fromCurrency = currencies.firstWhere(
          (item) => item.name == fromCurrency.name,
        );

        toCurrency = currencies.firstWhere(
          (item) => item.name == toCurrency.name,
        );
      }
    } catch (e) {
      print('Erro ao buscar dados: $e');
    }
  }

  void convert() {
    String text = fromText.text;
    double value = double.tryParse(text.replaceAll(',', '.')) ?? 1.0;
    double returnValue = 0;

    double valueInReais = value * fromCurrency.real;

    returnValue = valueInReais / toCurrency.real;

    if (toCurrency.name == 'Bitcoin') {
      toText.text = returnValue.toStringAsFixed(6);
    } else {
      toText.text = returnValue.toStringAsFixed(2);
    }
  }
}
