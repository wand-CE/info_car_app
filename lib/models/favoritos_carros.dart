import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:info_car_app/models/carro.dart';

class FavoritosCarros extends ChangeNotifier {
  final List<Carro> _carros = [];

  UnmodifiableListView<Carro> get carros => UnmodifiableListView(_carros);

  void add(Carro carro) {
    if (isInlist(carro)) {
      _carros.add(carro);
      notifyListeners();
    }
  }

  void remove(Carro carro) {
    if (_carros.contains(carro)) {
      _carros.remove(carro);
      notifyListeners();
    }
  }

  bool isInlist(Carro carro) {
    return _carros.every((car) => car.modelo != carro.modelo);
  }
}
