//Wanderson Soares dos Santos 05-11-2023

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
              PrincipalPage(),
              Center(child: Text('Favoritos')),
              Center(child: Text('Perfil')),
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

class PrincipalPage extends StatelessWidget {
  const PrincipalPage({Key? key});

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
                  TextButton(
                    onPressed: () {},
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
                  children: [
                    MarcaCarro('acura'),
                    MarcaCarro('acura'),
                    MarcaCarro('acura'),
                    MarcaCarro('acura'),
                    MarcaCarro('acura'),
                    MarcaCarro('acura'),
                    MarcaCarro('acura'),
                    MarcaCarro('acura'),
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

  MarcaCarro(this.name);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: Column(
          children: [
            Image.asset(
              'images/acura_logo.png',
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
