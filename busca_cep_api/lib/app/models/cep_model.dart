class CepModel {
  final String cep;
  final String logradouro;
  final String bairro;
  final String cidade; // Mapeado de 'localidade'
  final String uf;
  final String ddd;

  CepModel({
    required this.cep,
    required this.logradouro,
    required this.bairro,
    required this.cidade,
    required this.uf,
    required this.ddd,
  });

  factory CepModel.fromJson(Map<String, dynamic> json) {
    return CepModel(
      cep: json['cep'],
      logradouro: json['logradouro'],
      bairro: json['bairro'],
      cidade:
          json['localidade'], // A API manda 'localidade', nós usamos 'cidade'
      uf: json['uf'],
      ddd: json['ddd'],
    );
  }
}
