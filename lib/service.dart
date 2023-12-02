import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:info_car_app/models/carro.dart';
import 'models/marca.dart';

Future<List<Marca>> fetchAlbumMarca() async {
  final response = await http
      .get(Uri.parse('https://parallelum.com.br/fipe/api/v2/cars/brands'));

  if (response.statusCode == 200) {
    final List body = json.decode(response.body);
    return body.map((e) => Marca.fromJson(e)).toList();
  } else {
    throw Exception('Failed to load album');
  }
}

Future<List<Carro>> fetchAlbumListaCarros(String marcaId) async {
  final responseModels = await http.get(
    Uri.parse(
        'https://parallelum.com.br/fipe/api/v2/cars/brands/$marcaId/models'),
  );

  if (responseModels.statusCode == 200) {
    final modelosMarca = json.decode(responseModels.body);

    final List<Future<http.Response>> futures = [];

    for (var modelId in modelosMarca.take(5)) {
      final futureYears = http.get(Uri.parse(
          'https://parallelum.com.br/fipe/api/v2/cars/brands/$marcaId/models/${modelId['code']}/years'));
      futures.add(futureYears);
    }

    final List<http.Response> responsesYears = await Future.wait(futures);

    final List<Carro> listaCarros = [];

    for (var i = 0; i < modelosMarca.take(5).length; i++) {
      final primeiroAno = json.decode(responsesYears[i].body)[0]['code'];

      final responseCarro = await http.get(Uri.parse(
          'https://parallelum.com.br/fipe/api/v2/cars/brands/$marcaId/models/${modelosMarca[i]['code']}/years/${primeiroAno}'));

      if (responseCarro.statusCode == 200) {
        final primeiroCarro = json.decode(responseCarro.body);
        listaCarros.add(Carro.fromJson(primeiroCarro));
      } else {
        throw Exception('Falha ao obter carro: ${responseCarro.statusCode}');
      }
    }

    return listaCarros;
  } else {
    throw Exception('Falha ao obter modelos: ${responseModels.statusCode}');
  }
}
