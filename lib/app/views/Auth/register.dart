import 'package:flutter/material.dart';
import 'dart:convert'; // Para convertir a JSON
import 'seleccion_roles.dart'; // Asegúrate de importar la pantalla de selección de roles

class RegisterScreen extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrarse'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: 'Usuario',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Contraseña',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 16),
            TextField(
              controller: confirmPasswordController,
              decoration: InputDecoration(
                labelText: 'Confirmar Contraseña',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // Crear un mapa de datos del usuario
                Map<String, String> userData = {
                  'username': usernameController.text,
                  'password': passwordController.text,
                  'confirmPassword': confirmPasswordController.text,
                };

                // Convertir el mapa a JSON
                String jsonUserData = json.encode(userData);

                // Navega a la pantalla de selección de roles y pasa los datos JSON
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        RoleSelectionScreen(userDataJson: jsonUserData),
                  ),
                );
              },
              child: Text('Siguiente'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                backgroundColor: Colors.blueAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
