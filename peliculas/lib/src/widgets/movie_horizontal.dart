import 'package:flutter/material.dart';
import 'package:peliculas/src/models/pelicula_model.dart';

class MovieHorizontal extends StatelessWidget {
  final List<Pelicula> peliculas;
  final Function siguientePagina;
  MovieHorizontal(
      {super.key, required this.peliculas, required this.siguientePagina});

  final _pageController = new PageController(
    initialPage: 1,
    viewportFraction: 0.3,
  );
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    // Para que el PageView se mueva solo
    _pageController.addListener(() {
      if (_pageController.position.pixels >=
          _pageController.position.maxScrollExtent - 200) {
        //print('Cargar siguientes peliculas');
        siguientePagina();
      }
    });

    return Container(
      height: _screenSize.height * 0.25,
      child: PageView.builder(
        // PageView es como un ListView pero horizontal
        // children: _tarjetas(context),
        //children: _tarjetas(),
        controller: _pageController,
        pageSnapping: false,
        itemCount: peliculas.length,
        itemBuilder: (context, i) {
          return _tarjeta(context, peliculas[i]);
        },
      ),
    );
  }

  // Una sola pelicula
  Widget _tarjeta(BuildContext context, Pelicula pelicula) {
    final tarjeta = Container(
      margin: const EdgeInsets.only(right: 15.0),
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: FadeInImage(
              image: NetworkImage(
                pelicula.getPosterImg(),
              ),
              placeholder: const AssetImage('assets/img/no-image.jpg'),
              fit: BoxFit.cover, // Para que la imagen se ajuste al contenedor
              height: 150.0,
            ),
          ),
          SizedBox(height: 5.0),
          Text(
            pelicula.title,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Color.fromARGB(255, 2, 1, 1),
            ),
          ),
        ],
      ),
    );
    // Para que la tarjeta sea clickeable
    return GestureDetector(
      child: tarjeta,
      onTap: () {
        print('ID de la pelicula ${pelicula.id}');
        //Navigator.pushNamed(context, 'detalle', arguments: pelicula);
      },
    );
  }

  //todas las peliculas
  List<Widget> _tarjetas() {
    return peliculas.map((pelicula) {
      return Container(
        margin: const EdgeInsets.only(right: 15.0),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: FadeInImage(
                image: NetworkImage(
                  pelicula.getPosterImg(),
                ),
                placeholder: const AssetImage('assets/img/no-image.jpg'),
                fit: BoxFit.cover, // Para que la imagen se ajuste al contenedor
                height: 150.0,
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              pelicula.title,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Color.fromARGB(255, 2, 1, 1),
              ),
            ),
          ],
        ),
      );
    }).toList();
  }
}
