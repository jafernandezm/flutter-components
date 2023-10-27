import 'package:flutter/material.dart';


class HomePageTemp extends StatelessWidget {
  final opciones = ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco'];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Componentes Temp'),
      ),
      body: ListView(
        children:  _crearItemsCorta(),

      ),
    );

  }

  List<Widget> _crearItems(){

    List<Widget> lista = <Widget>[];
    for (String opt in opciones) {
      final tempWidget = ListTile(
        title: Text(opt),
      );
      lista..add(tempWidget)
          ..add( Divider(color: Colors.black,));
      //lista.add(Divider());
    }
    return lista;
  }
  //segunda forma con el map
  List<Widget> _crearItemsCorta(){
    //el item tiene el valor
    return opciones.map( (item) {
      return Column(
        children: <Widget>[
          ListTile(
            title: Text(item + '!'),
            subtitle: Text('Cualquier cosa'),
            leading: Icon(Icons.account_balance_wallet),//al inicio
            trailing: Icon(Icons.keyboard_arrow_right), // al final
            onTap: (){ // funcion que se ejecuta al darle click
              //print('click');

            },
          ),
          Divider(color: Colors.black,)
        ],
      );
    }).toList();

  }
  
}