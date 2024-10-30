import 'dart:convert'; // Importa para el manejo de JSON
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // Importa para hacer solicitudes HTTP
import 'enviar_documentos.dart'; // Asegúrate de que el archivo se llame así

class RegistrarDatosScreen extends StatelessWidget {
  final Map<String, dynamic> userData; // Recibe el mapa de datos del usuario, incluyendo la contraseña

  RegistrarDatosScreen({required this.userData}); // Constructor para recibir los datos

  final TextEditingController nombreController = TextEditingController();
  final TextEditingController apellidoController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController paisController = TextEditingController();
  final TextEditingController ciudadController = TextEditingController();
  final TextEditingController distritoController = TextEditingController();
  final TextEditingController telefonoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String tipoUsuario = userData['tipo_usuario'] ?? 'Desconocido';
    String password = userData['password'] ?? ''; 
    
    nombreController.text = userData['nombre'] ?? '';
    apellidoController.text = userData['apellido'] ?? '';
    emailController.text = userData['email'] ?? '';
    paisController.text = userData['pais'] ?? '';
    ciudadController.text = userData['ciudad'] ?? '';
    distritoController.text = userData['distrito'] ?? '';
    telefonoController.text = userData['telefono'] ?? '';

    return Scaffold(
      appBar: AppBar(
        title: Text('Registro'),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                '¡Bienvenido, ${userData['username']}! ',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                'En este apartado, registraremos tus datos',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),
              TextField(
                controller: nombreController,
                decoration: InputDecoration(
                  labelText: 'Nombre completo',
                  border: OutlineInputBorder(),
                  hintText: 'Ingresa tu nombre completo',
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: apellidoController,
                decoration: InputDecoration(
                  labelText: 'Apellido',
                  border: OutlineInputBorder(),
                  hintText: 'Ingresa tus apellidos',
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                  hintText: 'Ingresa tu email',
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 20),
              TextField(
                controller: paisController,
                decoration: InputDecoration(
                  labelText: 'País',
                  border: OutlineInputBorder(),
                  hintText: 'Ingresa tu país',
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: ciudadController,
                decoration: InputDecoration(
                  labelText: 'Ciudad',
                  border: OutlineInputBorder(),
                  hintText: 'Ingresa tu ciudad',
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: distritoController,
                decoration: InputDecoration(
                  labelText: 'Distrito',
                  border: OutlineInputBorder(),
                  hintText: 'Ingresa tu distrito',
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: telefonoController,
                decoration: InputDecoration(
                  labelText: 'Teléfono',
                  border: OutlineInputBorder(),
                  hintText: 'Ingresa tu número de teléfono',
                ),
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 20),
              TextField(
                controller: TextEditingController(text: tipoUsuario),
                decoration: InputDecoration(
                  labelText: 'Tipo de Usuario',
                  border: OutlineInputBorder(),
                ),
                readOnly: true,
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () async {
                  // Preparar los datos a enviar
                  final Map<String, dynamic> data = {
                    'nombre': nombreController.text,
                    'apellido': apellidoController.text,
                    'email': emailController.text,
                    'tipo_usuario': tipoUsuario,
                    'pais': paisController.text,
                    'ciudad': ciudadController.text,
                    'distrito': distritoController.text,
                    'telefono': telefonoController.text,
                    'password': password, 
                  };

                  print(data);

                  try {
                    // Enviar datos a la API
                    final response = await http.post(
                      Uri.parse('http://192.168.98.133:3000/api/users/register'),
                      headers: <String, String>{
                        'Content-Type': 'application/json; charset=UTF-8',
                      },
                      body: jsonEncode(data),
                    );

                    if (response.statusCode == 200 || response.statusCode == 201) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Datos registrados con éxito')),
                      );

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EnviarDocumentosScreen()),
                      );
                    } else {
                      print('Error en el registro: ${response.body}');
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Error al registrar los datos')),
                      );
                    }
                  } catch (e) {
                    print('Error de conexión: $e');
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Error de conexión con el servidor')),
                    );
                  }
                },
                child: Text('Registrar Datos'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Nota: Asegúrate de que toda la información sea correcta.',
                style: TextStyle(fontSize: 14, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
