import 'package:flutter/material.dart';
//es para el avatar la clases es CircleAvatar y NetworkImage para la imagen de internet

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: <Widget>[
          // para agregar mas iconos en el appbar
          Container(
            padding: EdgeInsets.all(4.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://upload.wikimedia.org/wikipedia/commons/9/99/Sample_User_Icon.png'),
              radius: 30.0, //para el tamaño del circulo
            ),
          ),
          Container(
            padding: EdgeInsets.all(4.0),
            child: CircleAvatar(
              child: Text('SL'),
              backgroundColor: Colors.brown,
            ),
          ),
        ],
      ),
      body: Center(
        child: FadeInImage(
          // para mostrar una imagen con un efecto de carga
          image: NetworkImage(
              'https://upload.wikimedia.org/wikipedia/commons/9/99/Sample_User_Icon.png'),
          placeholder: AssetImage('assets/jar-loading.gif'),
          fadeInDuration: Duration(milliseconds: 200),
        ),
      ),
    );
  }
}
