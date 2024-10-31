import 'package:flutter/material.dart';
import 'dart:convert'; // Para convertir desde JSON
import 'registrar_datos.dart'; // Asegúrate de importar la pantalla de registro de datos

class RoleSelectionScreen extends StatelessWidget {
  final String userDataJson; // Recibir la cadena JSON

  RoleSelectionScreen(
      {required this.userDataJson}); // Constructor para recibir los datos

  @override
  Widget build(BuildContext context) {
    // Convertir la cadena JSON de nuevo a un mapa
    Map<String, dynamic> userData = json.decode(userDataJson);

    return Scaffold(
      appBar: AppBar(
        title: Text('Selecciona tu Rol'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '¿Quién eres?',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  userData['tipo_usuario'] =
                      'Contratista'; // Asignar el tipo de usuario
                  // Navega al formulario de registro al seleccionar Contratista
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          RegistrarDatosScreen(userData: userData),
                    ),
                  );
                },
                child: Card(
                  elevation: 5,
                  child: Column(
                    children: [
                      Image.asset('assets/images/contratista.png', height: 100),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'Contratista',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  userData['tipo_usuario'] =
                      'Colaborador'; // Asignar el tipo de usuario
                  // Navega al formulario de registro al seleccionar Colaborador
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          RegistrarDatosScreen(userData: userData),
                    ),
                  );
                },
                child: Card(
                  elevation: 5,
                  child: Column(
                    children: [
                      Image.asset('assets/images/colaborador.png', height: 100),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'Colaborador',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
