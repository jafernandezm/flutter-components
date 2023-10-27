import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  const SliderPage({super.key});

  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 100.0;
  bool _bloquearCheck = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slider'),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            _crearSlider(),
            const Divider(),
            _crearImagen(),
            const Divider(),
            _checkBox(),
            const Divider(),
            _crearSwitch(),
            const Divider(),
            //Expanded(child: _crearImagen()),
          ],
        ),
      ),
    );
  }

  // Crear un switch para activar y desactivar el bloquear slider
  Widget _crearSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Tamaño de la imagen', //Texto que aparece arriba del slider
      divisions: 20,
      value: _valorSlider,
      min: 10.0,
      max: 400.0,
      onChanged: (_bloquearCheck)
          ? null
          : (valor) {
              //Funcion que se ejecuta cuando se mueve el slider
              //print(valor);
              setState(() {
                _valorSlider = valor;
              });
            },
    );
  }

  Widget _crearImagen() {
    return Image(
      image: NetworkImage(
          'https://i0.wp.com/imagenesparapeques.com/wp-content/uploads/2021/05/Mario-Bros-png-transparente.png?resize=651%2C828&ssl=1'),
      width: _valorSlider,
      fit: BoxFit.contain,
    );
  }

  // Crear un switch para activar y desactivar el bloquear slider
  Widget _checkBox() {
    // return Checkbox(
    //   value: _bloquearCheck,
    //   onChanged: (valor) {
    //     setState(() {
    //       _bloquearCheck = valor!;
    //     });
    //   },
    // );

    return CheckboxListTile(
      title: const Text('Bloquear slider'),
      value: _bloquearCheck,
      onChanged: (valor) {
        setState(() {
          _bloquearCheck = valor!;
        });
      },
    );
  }

  Widget _crearSwitch() {
    return SwitchListTile(
      title: const Text('Bloquear slider'),
      value: _bloquearCheck,
      onChanged: (valor) {
        setState(() {
          _bloquearCheck = valor;
        });
      },
    );
  }
}
