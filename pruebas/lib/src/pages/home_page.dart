
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '';


class HomePage extends StatelessWidget{

  final estiloLetras= new TextStyle(fontSize: 35.0);
  final contador =0 ;

  @override
  build(BuildContext context) {
    return Scaffold(
        appBar:  AppBar(
          title: Text('Contador'),
          centerTitle: true, // centrar
        ),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center, // centrar
                children:<Widget>[
                  Text('Numero de Clicks',style: estiloLetras),
                  Text(contador.toString(), style: estiloLetras),// cambiar el tamano de la letra
                ]
            )
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: (){
            //_contador++;
          },
        ),

        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat // centrar el boton
    );
  }
}

