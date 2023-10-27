import 'dart:async';
import 'dart:convert';

import '../models/pelicula_model.dart';
import 'package:http/http.dart' as http;

class PeliculasProvider {
  String _apiKey = '11c6243f501cdf5dfb7551e16956b070';
  String _url = 'api.themoviedb.org';
  String _language = 'es-ES';

  int _popularesPage = 0;
  bool _cargando = false;

  List<Pelicula> _populares = []; // lista de peliculas populares
  final _popularesStreamController = StreamController<
      List<Pelicula>>.broadcast(); // stream para escuchar los populares
  // sink para agregar peliculas a la lista
  Function(List<Pelicula>) get popularesSink =>
      _popularesStreamController.sink.add;
  // stream para escuchar las peliculas
  Stream<List<Pelicula>> get popularesStream =>
      _popularesStreamController.stream;

  void disposeStreams() {
    _popularesStreamController?.close();
  }

  Future<List<Pelicula>> _procesarResouesta(Uri url) async {
    final response = await http.get(url);
    final decodedData = json.decode(response.body);
    //print(decodedData['results']);
    final peliculas = new Peliculas.fromJsonList(decodedData['results']);
    //print(peliculas.items[1].title);
    return peliculas.items;
  }

  Future<List<Pelicula>> getEnCines() async {
    final url = Uri.https(
      _url,
      '3/movie/now_playing',
      {
        'api_key': _apiKey,
        'language': _language,
      },
    );

    return await _procesarResouesta(url);
  }

  Future<List<Pelicula>> getPopulares() async {
    // evitar que se hagan multiples llamadas al servicio
    if (_cargando) return [];
    _cargando = true;

    print('Cargando siguientes...');
    _popularesPage++;
    final url = Uri.https(
      _url,
      '3/movie/popular',
      {
        'api_key': _apiKey,
        'language': _language,
        'page': _popularesPage.toString(),
      },
    );
    final resp = await _procesarResouesta(url);
    _populares.addAll(resp);
    popularesSink(_populares);
    _cargando = false;
    return resp;

    //return await _procesarResouesta(url);
  }
}
