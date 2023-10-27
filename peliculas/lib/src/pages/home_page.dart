import 'package:flutter/material.dart';
import 'package:peliculas/src/providers/peliculas_providers.dart';

import 'package:peliculas/src/widgets/card_swiper.dart';
import 'package:peliculas/src/widgets/movie_horizontal.dart';

import '../models/pelicula_model.dart';

class HomePage extends StatelessWidget {
  final peliculasProvider = new PeliculasProvider();
  @override
  Widget build(BuildContext context) {
    // llamamos al metodo que trae las peliculas
    peliculasProvider.getPopulares();
    return Scaffold(
      appBar: AppBar(
        title: Text('Peliculas'),
        backgroundColor: Colors.indigoAccent,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.spaceAround, // espacio entre los widgets
          children: <Widget>[
            _swiperTarjetas(),
            _footer(context),
          ],
        ),
        //_footer(context),
      ),
    );
  }

  Widget _swiperTarjetas() {
    return FutureBuilder(
      future: peliculasProvider.getEnCines(),
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>?> snapshot) {
        if (snapshot.hasData) {
          List<Pelicula> peliculas = (snapshot.data ?? []).cast<Pelicula>();
          return CardCarouselSlider(
            peliculas: peliculas,
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );

    // peliculasProvider.getEnCines();

    // return CardCarouselSlider(
    //   peliculas: [1, 2, 3, 4],
    // );
  }

  Widget _footer(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // alineacion a la izq
        children: <Widget>[
          //acomonar el texto
          Container(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text('Populares',
                  style: Theme.of(context).textTheme.subtitle1)),
          SizedBox(height: 5.0),

          //este es el future builder de la lista de peliculas populares
          StreamBuilder(
            stream: peliculasProvider.popularesStream,
            builder:
                (BuildContext context, AsyncSnapshot<List<dynamic>?> snapshot) {
              if (snapshot.hasData) {
                List<Pelicula> peliculas =
                    (snapshot.data ?? []).cast<Pelicula>();
                //print('Cantidad de películas: ${peliculas[0].title}');
                return MovieHorizontal(
                  peliculas: peliculas,
                  siguientePagina: peliculasProvider.getPopulares,
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
          //
        ],
      ),
      //color: Colors.indigoAccent,
    );
  }
}
