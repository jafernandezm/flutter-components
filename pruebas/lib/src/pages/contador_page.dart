import 'package:flutter/material.dart';


class ContadorPage extends StatefulWidget {
  @override
  createState() => _ContadorPageState();

}

class _ContadorPageState extends State<ContadorPage> {
  final _estiloLetras= new TextStyle(fontSize: 35.0);
  int _contador =0 ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:  AppBar(
          title: Text('Contador Stateful'),
          centerTitle: true, // centrar
        ),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center, // centrar
                children:<Widget>[
                  Text('Numero de Clicks',style: _estiloLetras),
                  Text(_contador.toString(), style: _estiloLetras),// cambiar el tamano de la letra
                ]
            )
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat, // centrar el boton

        floatingActionButton: _crearBotones(),



    );
  }

  Widget _crearBotones(){
    return  Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        SizedBox(width: 10.0),
        FloatingActionButton(child: Icon(Icons.exposure_zero), onPressed: _cero ),
        Expanded(child: SizedBox()),
        FloatingActionButton(child: Icon(Icons.add), onPressed: _agregar ),
        SizedBox(width: 10.0),
        FloatingActionButton(child: Icon(Icons.remove), onPressed:(){ remove(); } ),
        SizedBox(width: 12.0),
      ],
    );
  }
  void _agregar(){
    setState(() {
      _contador++;
    });
  }
  void remove (){
    setState(() {
      _contador--;
    });
  }
  void _cero(){
    setState(() {
      _contador=0;
    });
  }
}