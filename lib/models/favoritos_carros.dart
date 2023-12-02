import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:info_car_app/models/carro.dart';

class FavoritosCarros extends ChangeNotifier {
  final List<Carro> _carros = [];

  UnmodifiableListView<Carro> get carros => UnmodifiableListView(_carros);

  void add(Carro carro) {
    _carros.add(carro);
    notifyListeners();
  }
}
