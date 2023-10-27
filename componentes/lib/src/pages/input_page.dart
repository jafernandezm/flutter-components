import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = '';
  String _email = '';
  String _fecha = '';
  String _opcionSeleccionada = 'Volar';

  List _poderes = ['Volar', 'Rayos X', 'Super Aliento', 'Super Fuerza'];

  TextEditingController _inputFieldDateController =
      new TextEditingController(); //Controlador del input es para poder cambiar el valor del input
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs de texto'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearDropdown(),
          Divider(),
          _crearPersona(),
          Divider(),
        ],
      ),
    );
  }

  //Primer ejemplo de input
  Widget _crearInput() {
    return TextField(
      //autofocus: true,
      textCapitalization:
          TextCapitalization.sentences, //Primera letra en mayuscula
      decoration: InputDecoration(
        //Decoracion del input
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0)), //Borde del input
        counter: Text('Letras ${_nombre.length}'), //Contador de letras
        hintText:
            'Nombre de la persona', //Texto que aparece cuando no hay nada escrito
        labelText: 'Nombre', //Texto que aparece arriba del input
        helperText: 'Solo es el nombre', //Texto de ayuda
        suffixIcon: Icon(Icons.accessibility), //Icono a la derecha
        icon: Icon(Icons.account_circle), //Icono a la izquierda
      ), //
      //onChanged: (valor) => setState(() {}), //Cuando cambia el valor del input
      onChanged: (valor) {
        //Cuando cambia el valor del input
        setState(() {
          _nombre = valor;
        });
      },
    );
  }

  Widget _crearPassword() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Password',
          labelText: 'Password',
          suffixIcon: Icon(Icons.lock_open),
          icon: Icon(Icons.lock)),
      onChanged: (valor) => setState(() {
        _email = valor;
      }),
    );
  }

  //Primer ejemplo de input
  //
  Widget _crearEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress, //Tipo de teclado
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Email',
          labelText: 'Email',
          suffixIcon: Icon(Icons.alternate_email),
          icon: Icon(Icons.email)),
      onChanged: (valor) => setState(() {
        _email = valor;
      }),
    );
  }

  Widget _crearFecha(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false, //No permite seleccionar el texto
      controller: _inputFieldDateController, //Controlador del input
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Fecha de nacimiento',
          labelText: 'Fecha de nacimiento',
          suffixIcon: Icon(Icons.perm_contact_calendar),
          icon: Icon(Icons.calendar_today)),
      onTap: () {
        //Quita el foco del input
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(), //Fecha inicial
        firstDate: new DateTime(2018), //Fecha inicial
        lastDate: new DateTime(2025), //Fecha final
        locale: Locale('es', 'ES') //Idioma
        );
    if (picked != null) {
      setState(() {
        _fecha = picked.toString();
        _fecha = _fecha.substring(0, 10); //Corta la fecha

        _inputFieldDateController.text =
            _fecha; //Asigna el valor de la fecha al input
      });
    }
  }

  // DropdownButton y DropdownMenuItem
  Widget _crearDropdown() {
    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(
          width: 30.0,
        ),
        Expanded(
          child: DropdownButton(
            value: _opcionSeleccionada,
            items: getOpcionesDropdown(),
            onChanged: (opt) {
              setState(() {
                _opcionSeleccionada = opt.toString();
              });
              //print(opt);
            },
          ),
        ),
      ],
    );
  }

  //Lista de opciones del dropdown
  List<DropdownMenuItem<String>> getOpcionesDropdown() {
    List<DropdownMenuItem<String>> lista = [];

    _poderes.forEach((poder) {
      lista.add(DropdownMenuItem(
        child: Text(poder),
        value: poder,
      ));
    });
    return lista;
  }

  //Segundo ejemplo de input
  Widget _crearPersona() {
    return ListTile(
      title: Text('Nombre es: $_nombre'), //Texto del titulo
      subtitle: Text('Email: $_email'), //Texto debajo del titulo
      trailing: Text(_opcionSeleccionada), //Texto a la derecha
    );
  }
}
