import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body: ListView(
        padding: EdgeInsets.all(20.0),// padding para el espacio de la tarjeta padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 10.0),
        children: <Widget>[
          _cardTipo1(),
          SizedBox(height: 30.0,),
          _cardTipo2(),
          SizedBox(height: 30.0,),
          _cardTipo1(),
          SizedBox(height: 30.0,),
          _cardTipo2(),
          SizedBox(height: 30.0,),
          _cardTipo1(),
          SizedBox(height: 30.0,),
          _cardTipo2(),
        ],
      ),
    );

  }

  Widget _cardTipo1() {
    return Card(
      elevation: 10.0, // para las sombreas
      shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20.0) ), // para las esquinas redondeadas
      child: Column(
         children: <Widget>[
           ListTile(
             leading: Icon(Icons.photo_album, color: Colors.blue,),
             title: Text('Soy el titulo de esta tarjeta'),
             subtitle: Text('Aqui estamos con la descripcion de la tarjeta que quiero que ustedes vean para tener una idea de lo que quiero mostrarles'),
           ),
           Row(
              mainAxisAlignment: MainAxisAlignment.end, // para que se alinie a la derecha
             children: <Widget>[
                 TextButton(

                   child: Text('Cancelar'),
                   onPressed: (){},
                 ),
                  TextButton(

                    child: Text('Ok'),
                    onPressed: (){},
                  ),

             ],
           )
         ]
      ),
    );
  }

  Widget _cardTipo2(){
    final card= Container(
      //clipBehavior: Clip.antiAlias, // para que no se salga de la tarjeta
      child: Column(
        children: <Widget>[
          FadeInImage(
            image: NetworkImage("https://images.pexels.com/photos/1287145/pexels-photo-1287145.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 300.0,
            fit: BoxFit.cover,
          ),

          /*Image(
              image: NetworkImage("https://images.pexels.com/photos/1287145/pexels-photo-1287145.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
          ),*/
          Container(
              padding: EdgeInsets.all(10.0),
              child:Text('data')


          )

      
        ],
      ),
    );
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white,
        boxShadow: <BoxShadow>[ // para la sombra
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0, // para la difuminacion
            spreadRadius: 2.0, // para la difuminacion
            offset: Offset(2.0, 10.0) // para la posicion de la sombra
          )
        ]
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: card,
      )
    );
  }
}
