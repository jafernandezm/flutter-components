import 'package:flutter/material.dart';

import 'dart:async';

class ListaPage extends StatefulWidget {
  const ListaPage({super.key});

  @override
  State<ListaPage> createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  ScrollController _scrollController = new ScrollController();

  // SE ENCARGA DE CREAR UNA LISTA DE NUMEROS
  List<int> _listaNumeros = [];
  int _ultimoItem = 0;
  // SE ENCARGA DE CREAR UNA VARIABLE QUE SE ENCARGA DE SABER SI ESTA CARGANDO
  bool _isLoading = false;

  // SE ENCARGA DE INICIALIZAR EL ESTADO
  @override
  void initState() {
    super.initState();
    _agregar10();

    // SE ENCARGA DE ESCUCHAR EL SCROLL
    _scrollController.addListener(() {
      // SE ENCARGA DE VERIFICAR SI EL SCROLL LLEGO AL FINAL
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        //_agregar10();
        fetchData();
      }
    });
  }

  // SE ENCARGA DE DESTRUIR EL ESTADO
  @override
  void dispose() {
    super.dispose();
    // SE ENCARGA DE DESTRUIR EL SCROLL
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listas'),
      ),
      body: Stack(
        children: <Widget>[
          _crearLista(),
          _crearLoading(),
        ],
      ),
    );
  }

  // SE ENCARGA DE CREAR LA LISTA DE IMAGENES CON EL SCROLL INFINITO
  // PAR DEVOLVER VARIOS WIDGETS SE USA EL BUILDER
  Widget _crearLista() {
    return RefreshIndicator(
      onRefresh: obtenerPagina1, // no puede ser una funcion asincrona
      child: ListView.builder(
        controller: _scrollController, // SE ENCARGA DE CONTROLAR EL SCROLL
        itemCount: _listaNumeros.length, // CANTIDAD DE ELEMENTOS
        itemBuilder: (BuildContext context, int index) {
          // EL ITEM BUILDER SE ENCARGA DE CREAR LOS ELEMENTOS
          final imagen = _listaNumeros[index]; // SE ENCARGA DE CREAR LA IMAGEN
          return FadeInImage(
            placeholder: AssetImage('assets/jar-loading.gif'),
            image: NetworkImage('https://picsum.photos/500/300/?image=$imagen'),
          );
        },
      ),
    );
  }

  Future<Object> obtenerPagina1() async {
    final duration = Duration(seconds: 2);
    return Timer(duration, () {
      _listaNumeros.clear();
      _ultimoItem++;
      _agregar10();
    });
    return Future.delayed(duration);
  }

  void _agregar10() {
    for (int i = 1; i < 10; i++) {
      _ultimoItem++; // SE ENCARGA DE AGREGAR UN ELEMENTO A LA LISTA
      _listaNumeros.add(_ultimoItem);
    }

    setState(() {
      // SE ENCARGA DE AGREGAR 10 ELEMENTOS A LA LISTA
    });
  }

  // SE ENCARGA DE SIMULAR UNA PETICION HTTP
  Future<Timer> fetchData() async {
    // SE ENCARGA DE SIMULAR UNA PETICION HTTP
    _isLoading = true;
    setState(() {});

    // SE ENCARGA DE SIMULAR UNA PETICION HTTP
    final duration = Duration(seconds: 2);
    return Timer(duration, respuestaHTTP);
  }

  // SE ENCARGA DE SIMULAR UNA PETICION HTTP
  void respuestaHTTP() {
    _isLoading = false;
    _scrollController.animateTo(
      _scrollController.position.pixels + 100, // SE ENCARGA DE MOVER EL SCROLL
      duration: const Duration(milliseconds: 250),
      curve: Curves.fastOutSlowIn,
    );
    _agregar10();
  }

  // SE ENCARGA DE SIMULAR UNA PETICION HTTP carga infinita
  Widget _crearLoading() {
    if (_isLoading) {
      return const Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[CircularProgressIndicator()],
          ),
          SizedBox(
            height: 15.0,
          )
        ],
      );
    } else {
      return Container();
    }
  }
}
