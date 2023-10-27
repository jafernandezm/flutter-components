import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alertas'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Mostrar Alerta'),
          //style: ElevatedButton.styleFrom(onSurface: Colors.red),
          onPressed: () => _mostrarAlert(context),
//76
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_location),
        onPressed: () {
          // metodo del boton para volver atras
          Navigator.pop(context);
        },
      ),
    );
  }

  void _mostrarAlert(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible:
            true, // para cerrar la alerta dando click fuera de ella
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.0)),
            title: Text('Titulo'),
            content: Column(
              mainAxisSize: MainAxisSize.min, // para que se adapte al contenido
              children: <Widget>[
                Text('Este es el contenido de la caja de la alerta'),
                FlutterLogo(
                  size: 100.0,
                ) // para mostrar el logo de flutter
              ],
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Cancelar'),
                onPressed: () =>
                    Navigator.of(context).pop(), // para cerrar la alerta
              ),
              TextButton(
                child: Text('Ok'),
                onPressed: () =>
                    Navigator.of(context).pop(), // para cerrar la alerta
              ),
            ],
          );
        });
  }
}
