import 'dart:async';
import 'package:flutter/material.dart';
import '../Auth/login_register.dart'; // Asegúrate de importar la pantalla de LoginRegister

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
            builder: (context) =>
                LoginRegisterScreen()), // Navega a la pantalla de Login/Register
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Fondo blanco
      body: Center(
        child: Image.asset('assets/images/logo.png',
            width: 250, height: 250), // Tamaño del logo
      ),
    );
  }
}
