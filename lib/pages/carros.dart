import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:info_car_app/models/carro.dart';
import 'package:info_car_app/models/marca.dart';
import 'package:info_car_app/service.dart';

class PageCar extends StatelessWidget {
  const PageCar({Key? key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MarcasBox(),
        CarrosDisponiveisBox(),
        MaisAcessadosBox(),
      ],
    );
  }
}

class MarcasBox extends StatelessWidget {
  const MarcasBox({Key? key});

  @override
  Widget build(BuildContext context) {
    const List<List> marcasPadrao = [
      ['Audi', '6'],
      ['BMW', '7'],
      ['Ferrari', '20'],
      ['Hyundai', '26'],
      ['Toyota', '56'],
      ['Subaru', '54'],
      ['Rover', '49'],
      ['Mercedes', '39'],
    ];

    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFF4F4F4),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Marcas',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      // Aqui você pode navegar para a página de lista de veículos da marca
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ListaMarcasPage(),
                        ),
                      );
                    },
                    child: Text(
                      'Ver todas',
                      style: TextStyle(
                        fontSize: 16,
                        decoration: TextDecoration.underline,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 160,
                child: GridView.count(
                  crossAxisCount: 4,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 10,
                  children: <Widget>[
                    for (List marca in marcasPadrao)
                      MarcaCarro(marca[0], marca[1])
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MarcaCarro extends StatelessWidget {
  final String name;
  final String marcaId;

  MarcaCarro(this.name, this.marcaId);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ListaVeiculosPage(marcaId: marcaId),
          ),
        );
      },
      child: DecoratedBox(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: Column(
            children: [
              Image.asset(
                'images/logos/${name.toLowerCase()}.png',
                width: 40,
                height: 40,
              ),
              Text(
                name,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ListaMarcasPage extends StatefulWidget {
  const ListaMarcasPage({super.key});

  @override
  State<ListaMarcasPage> createState() => _MarcasPage();
}

class _MarcasPage extends State<ListaMarcasPage> {
  late Future<List<Marca>> marcas;

  @override
  void initState() {
    super.initState();
    marcas = fetchAlbumMarca();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Marcas'),
      ),
      body: Center(
        child: FutureBuilder<List<Marca>>(
          future: marcas,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Marca> data = snapshot.data!;
              return ListView(
                children: [
                  for (Marca marca in data)
                    Container(
                      color: Colors.grey.shade300,
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                      height: 100,
                      width: double.maxFinite,
                      child: Row(
                        children: [
                          // Image.network(
                          //   '${marca.logoUrl}',
                          //   errorBuilder: (context, error, stackTrace) {
                          //     return Container(
                          //       color: Colors.amber,
                          //       alignment: Alignment.center,
                          //       child: const Text(
                          //         'Whoops!',
                          //         style: TextStyle(fontSize: 30),
                          //       ),
                          //     );
                          //   },
                          // ),
                          SizedBox(width: 10),
                          Expanded(
                            child: ListTile(
                              title: Text(marca.nome ?? ''),
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

class ListaVeiculosPage extends StatefulWidget {
  final String marcaId;

  const ListaVeiculosPage({super.key, required this.marcaId});

  @override
  State<ListaVeiculosPage> createState() => _VeiculosPage();
}

class _VeiculosPage extends State<ListaVeiculosPage> {
  late Future<List<Carro>> veiculos;

  @override
  void initState() {
    super.initState();
    veiculos = fetchAlbumListaCarros(widget.marcaId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Veículos da Marca'),
      ),
      body: Center(
        child: FutureBuilder<List<Carro>>(
          future: veiculos,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Carro> data = snapshot.data!;
              return ListView(
                children: [
                  for (Carro carro in data)
                    Text('${carro.modelo} ${carro.marca}'),
                ],
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

class CarrosDisponiveisBox extends StatelessWidget {
  const CarrosDisponiveisBox({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 20, 10, 10),
      decoration: BoxDecoration(
        color: Color(0xFFE0EAFF),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(28.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Carros disponíveis',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'Confira a lista completa',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                shadowColor: Colors.transparent,
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                padding: EdgeInsets.symmetric(vertical: 15)),
            child: Text(
              '>',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          )
        ],
      ),
    );
  }
}

class MaisAcessadosBox extends StatelessWidget {
  const MaisAcessadosBox({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFE6E6E6),
      margin: EdgeInsets.all(10),
      height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(8, 15, 0, 5),
            child: Text(
              'Mais acessados',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(8, 0, 0, 13),
            height: 125.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 8,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: EdgeInsets.all(8.0),
                  margin: EdgeInsets.all(4.0),
                  width: 125.0,
                  height: 220.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    children: [
                      Image.asset(
                        'images/integra.png',
                        width: 50,
                        height: 50,
                      ),
                      Text(
                        'INTEGRA',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        'Acura',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '\$31,500+',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
