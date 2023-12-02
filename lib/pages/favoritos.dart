import 'package:flutter/material.dart';
import 'package:info_car_app/models/favoritos_carros.dart';
import 'package:provider/provider.dart';

class PageFavoritos extends StatefulWidget {
  const PageFavoritos({Key? key}) : super(key: key);

  @override
  State<PageFavoritos> createState() => _PageFavoritosState();
}

class _PageFavoritosState extends State<PageFavoritos> {
  @override
  Widget build(BuildContext context) {
    final favoritosCarros = Provider.of<FavoritosCarros>(context);

    return Scaffold(
      body: favoritosCarros.carros.isEmpty
          ? Center(
              child: Text('Nenhum carro favorito'),
            )
          : ListView.builder(
              itemCount: favoritosCarros.carros.length,
              itemBuilder: (context, index) {
                final carro = favoritosCarros.carros[index];
                return ListTile(
                  leading: Image.asset(
                    'images/integra.png',
                    width: 70,
                    height: 70,
                  ),
                  title: Text('${carro.modelo}'),
                  subtitle: Text('${carro.marca}'),
                  trailing: InkWell(
                    onTap: () {
                      Provider.of<FavoritosCarros>(context, listen: false)
                          .remove(carro);
                      setState(() {
                        carro.favorito = !carro.favorito;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        carro.favorito
                            ? Icons.favorite
                            : Icons.favorite_border_outlined,
                        color: carro.favorito ? Colors.red : Colors.black,
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
