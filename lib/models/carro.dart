class Carro {
  String? modelo;
  String? marca;
  String? valor;
  String? descricao;
  String? imgUrl;

  Carro({
    this.modelo,
    this.marca,
    this.valor,
    this.descricao,
    this.imgUrl,
  });

  factory Carro.fromJson(Map<String, dynamic> json) {
    print('AQUI: $json');
    return switch (json) {
      {
        'model': String model,
        'brand': String brand,
        'price': String valor,
      } =>
        Carro(
          modelo: model,
          marca: brand,
          valor: valor,
        ),
      _ => throw const FormatException('Failed to load album.'),
    };
  }
}
