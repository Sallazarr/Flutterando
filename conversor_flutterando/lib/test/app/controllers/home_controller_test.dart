// import 'package:conversor_flutterando/app/controllers/home_controller.dart';
// import 'package:conversor_flutterando/app/models/currency_model.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';

// void main() {
//   final TextEditingController fromText = TextEditingController();
//   final TextEditingController toText = TextEditingController();

//   final homeController = HomeController(fromText: fromText, toText: toText);

//   test('converter real para dolar com virgula', () {
//     fromText.text = '2,0';
//     homeController.convert();
//     expect(toText.text, '0.36');
//   });

//   test('converter real para dolar', () {
//     fromText.text = '2.0';
//     homeController.convert();
//     expect(toText.text, '0.36');
//   });
//   test('converter dolar para real', () {
//     fromText.text = '1.0';
//     homeController.fromCurrency = CurrencyModel(
//       name: 'Dolar',
//       real: 5.63,
//       dolar: 1.0,
//       euro: 0.85,
//       bitcoin: 0.000088,
//     );

//     homeController.toCurrency = CurrencyModel(
//       name: 'Real',
//       real: 1.0,
//       dolar: 0.18,
//       euro: 0.15,
//       bitcoin: 0.000016,
//     );
//     homeController.convert();
//     expect(toText.text, '5.63');
//   });
// }
