import 'package:flutter/material.dart';
import 'registrar_datos.dart'; // Importa el formulario de registro

class RoleSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                  // Navega al formulario de registro al seleccionar Contratista
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegistrarDatosScreen()),
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
                  // Navega al formulario de registro al seleccionar Colaborador
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegistrarDatosScreen()),
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
