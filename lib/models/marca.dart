class Marca {
  String? nome;
  String? marcaId;
  String? logoUrl;

  Marca({
    this.nome,
    this.marcaId,
    this.logoUrl,
  });

  factory Marca.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'code': String marcaId,
        'name': String name,
      } =>
        Marca(
            nome: name,
            marcaId: marcaId,
            logoUrl:
                'https://raw.githubusercontent.com/filippofilip95/car-logos-dataset/master/logos/optimized/${name.toLowerCase().replaceAll(' ', '-')}.png'),
      _ => throw const FormatException('Failed to load album.'),
    };
  }
}
