//Wanderson Soares dos Santos 05-11-2023

import 'package:flutter/material.dart';
import 'package:info_car_app/models/carro.dart';
import 'package:info_car_app/models/favoritos_carros.dart';
import 'package:info_car_app/models/marca.dart';
import 'package:info_car_app/pages/carros.dart';
import 'package:info_car_app/pages/favoritos.dart';
import 'package:info_car_app/pages/perfil.dart';

import 'package:http/http.dart' as http;
import 'package:info_car_app/service.dart';
import 'package:provider/provider.dart';

//  flutter pub add provider
void main() {
  runApp(
    ChangeNotifierProvider(
      create: ((context) => FavoritosCarros()),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<List<Marca>> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbumMarca();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InfoCar App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFFEAEAEA),
            foregroundColor: Colors.black,
            title: Text("InfoCar App"),
            leading: Icon(
              Icons.menu,
              size: 30,
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 0.0,
                  horizontal: 15.0,
                ),
                child: Icon(
                  Icons.search,
                  size: 30,
                ),
              ),
            ],
          ),
          bottomNavigationBar: menu(),
          body: TabBarView(
            children: [
              PageCar(),
              PageFavoritos(),
              PagePerfil(),
            ],
          ),
        ),
      ),
    );
  }

  Widget menu() {
    return Container(
      height: 60,
      child: TabBar(
        indicator: BoxDecoration(color: Color(0xFFF2F2F2)),
        labelColor: Colors.black,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorPadding: EdgeInsets.all(5.0),
        indicatorColor: Color(0xFF6750A4),
        tabs: [
          Tab(
            icon: Icon(Icons.directions_car),
            text: "Principal",
          ),
          Tab(
            icon: Icon(Icons.favorite_border),
            text: "Favoritos",
          ),
          Tab(
            icon: Icon(Icons.person_outline_outlined),
            text: "Perfil",
          ),
        ],
      ),
    );
  }
}
