import 'dart:async';
import 'package:flutter/material.dart';
import 'seleccion_roles.dart'; // Importa la pantalla de selección de roles

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => RoleSelectionScreen()), // Navega a la pantalla de selección de roles
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Quitar el fondo azul
      backgroundColor: Colors.white, // Cambia el color de fondo a blanco
      body: Center(
        // Aumentar el tamaño de la imagen
        child: Image.asset('assets/images/logo.png', width: 200, height: 200), // Aumenta el tamaño a 200x200
      ),
    );
  }
}
