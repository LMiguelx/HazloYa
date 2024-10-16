import 'package:flutter/material.dart';
import 'package:hazloya/app/views/splash.dart'; // Asegúrate de importar la vista que deseas mostrar primero

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InDrive de Oficios',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(), // Aquí defines la pantalla inicial
      debugShowCheckedModeBanner: false,
    );
  }
}
