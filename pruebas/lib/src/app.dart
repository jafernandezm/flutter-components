
import 'package:flutter/material.dart';

//import 'package:pruebas/src/pages/home_page.dart';
import 'package:pruebas/src/pages/contador_page.dart';



class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build


    return MaterialApp(
        debugShowCheckedModeBanner: false, // quitar el banner

        home: Center(
          child: ContadorPage(),
        )

    );
  }

}