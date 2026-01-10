class CurrencyModel {
  final String name;
  final double real;

  CurrencyModel({required this.name, required this.real});

  static List<CurrencyModel> getCurrencies() {
    return <CurrencyModel>[
      CurrencyModel(name: 'Real', real: 1.0),
      CurrencyModel(name: 'Dolar', real: 5.63),
      CurrencyModel(name: 'Euro', real: 6.62),
      CurrencyModel(name: 'Bitcoin', real: 64116.51),
    ];
  }
}
