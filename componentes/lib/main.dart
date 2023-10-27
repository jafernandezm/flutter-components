import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
//rutas
import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/routes/router.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', 'US'), // English
        Locale('es', 'ES'), // Spanish
      ],
      title: 'Componentes App',
      //home: HomePage(),
      initialRoute: '/', // ruta inicial

      routes: getApplicationRoutes(), // rutas de la aplicacion
      onGenerateRoute: (RouteSettings settings) {
        // redirigir la ruta a una pagina en especifico
        //print( 'Ruta llamada: ${settings.name}' );
        return MaterialPageRoute(
            // regresa una ruta
            builder: (BuildContext context) => AlertPage());
      },
    );
  }
}
