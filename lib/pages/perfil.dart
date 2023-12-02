import 'package:flutter/material.dart';
import 'package:info_car_app/models/favoritos_carros.dart';
import 'package:provider/provider.dart';

import '../models/carro.dart';

class PagePerfil extends StatefulWidget {
  const PagePerfil({super.key});

  @override
  State<PagePerfil> createState() => _PagePerfilState();
}

class _PagePerfilState extends State<PagePerfil> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        //   Carro carro = Carro(
        //     modelo: "Onix",
        //     marca: 'Chevrolet',
        //     valor: 90000,
        //     descricao: "Onix Hatch 2023",
        //     imgUrl: '12345',
        //   );
        //   Provider.of<FavoritosCarros>(context, listen: false).add(carro);
      },
      child: Text("Inserir carro"),
    );
  }
}
