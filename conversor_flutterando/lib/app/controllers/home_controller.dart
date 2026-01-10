import 'package:conversor_flutterando/app/models/currency_model.dart';
import 'package:flutter/material.dart';

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

  void convert() {
    String text = fromText.text;
    double value = double.tryParse(text.replaceAll(',', '.')) ?? 1.0;
    double returnValue = 0;
    if (toCurrency.name == 'Real') {
      returnValue = value * fromCurrency.real;
    } else if (toCurrency.name == 'Dolar') {
      returnValue = value * fromCurrency.dolar;
    } else if (toCurrency.name == 'Euro') {
      returnValue = value * fromCurrency.euro;
    } else if (toCurrency.name == 'Bitcoin') {
      returnValue = value * fromCurrency.bitcoin;
    }

    if (toCurrency.name == 'Bitcoin') {
      toText.text = returnValue.toStringAsFixed(6);
    } else {
      toText.text = returnValue.toStringAsFixed(2);
    }
  }
}
