import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:peliculas/src/models/pelicula_model.dart';

// ignore: must_be_immutable
class CardCarouselSlider extends StatelessWidget {
  final List<Pelicula> peliculas;
  CardCarouselSlider({required this.peliculas});
  CarouselController buttonCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      width: screenSize.width * 1, // 70% del ancho de la pantalla
      height: screenSize.height * 0.4,
      child: CarouselSlider(
        items: _buildCarouselItems(context),
        carouselController: buttonCarouselController,
        options: CarouselOptions(
          height: screenSize.height * 0.3,
          autoPlay: false,
          enlargeCenterPage: true,
          viewportFraction: 0.9,
          aspectRatio: 2.0,
          initialPage: 2,
        ),
      ),
    );
  }

  List<Widget> _buildCarouselItems(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return peliculas.map((pelicula) {
      return Container(
        width: _screenSize.width * 0.80,
        height: _screenSize.height * 0.4,
        margin: EdgeInsets.symmetric(horizontal: 1.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: FadeInImage(
            image: NetworkImage(
              pelicula.getPosterImg(),
            ),
            placeholder: AssetImage('assets/img/no-image.jpg'),
            fit: BoxFit.cover, // Para que la imagen se ajuste al contenedor
          ),
        ),
      );
    }).toList();
  }
}

// options: CarouselOptions(
//           autoPlay: false,
//           enlargeCenterPage: true,
//           viewportFraction: 0.8,
//           aspectRatio: 2.0,
//           initialPage: 2,
//         ),
//         items: [1, 2, 3, 4, 5].map((i) {
//           return Builder(
//             builder: (BuildContext context) {
//               return Container(
//                 width: MediaQuery.of(context).size.width,
//                 margin: EdgeInsets.symmetric(horizontal: 4.0),
//                 decoration: BoxDecoration(
//                   color: Colors.amber,
//                   borderRadius: BorderRadius.circular(10.0),
//                 ),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(10.0),
//                   child: Image.network(
//                     'https://via.placeholder.com/350x150', // URL de la imagen
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               );
//             },
//           );
//         }).toList(),