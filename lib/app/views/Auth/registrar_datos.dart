import 'package:flutter/material.dart';
import 'package:hazloya/app/services/RegisterService.dart';
import 'package:hazloya/app/models/userModel.dart';
import 'enviar_documentos.dart';

class RegistrarDatosScreen extends StatelessWidget {
  final Map<String, dynamic> userData;

  RegistrarDatosScreen({required this.userData});

  final TextEditingController nombreController = TextEditingController();
  final TextEditingController apellidoController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController paisController = TextEditingController();
  final TextEditingController ciudadController = TextEditingController();
  final TextEditingController distritoController = TextEditingController();
  final TextEditingController telefonoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    nombreController.text = userData['nombre'] ?? '';
    apellidoController.text = userData['apellido'] ?? '';
    emailController.text = userData['email'] ?? '';
    paisController.text = userData['pais'] ?? '';
    ciudadController.text = userData['ciudad'] ?? '';
    distritoController.text = userData['distrito'] ?? '';
    telefonoController.text = userData['telefono'] ?? '';
    String tipoUsuario = userData['tipo_usuario'] ?? 'Desconocido';
    String password = userData['password'] ?? '';

    return Scaffold(
      appBar: AppBar(
        title: Text('Registro'),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: nombreController,
                decoration: InputDecoration(
                  labelText: 'Nombre completo',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: apellidoController,
                decoration: InputDecoration(
                  labelText: 'Apellido',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 20),
              TextField(
                controller: paisController,
                decoration: InputDecoration(
                  labelText: 'País',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: ciudadController,
                decoration: InputDecoration(
                  labelText: 'Ciudad',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: distritoController,
                decoration: InputDecoration(
                  labelText: 'Distrito',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: telefonoController,
                decoration: InputDecoration(
                  labelText: 'Teléfono',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 20),
              Text('Tipo de Usuario: $tipoUsuario'),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () async {
                  // Crear el modelo de usuario
                  UserModel user = UserModel(
                    nombre: nombreController.text,
                    apellido: apellidoController.text,
                    email: emailController.text,
                    tipoUsuario: tipoUsuario,
                    pais: paisController.text,
                    ciudad: ciudadController.text,
                    distrito: distritoController.text,
                    telefono: telefonoController.text,
                    password: password,
                  );

                  // Llamar al servicio para registrar
                  RegisterService service = RegisterService();
                  bool success = await service.registerUser(user);

                  if (success) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Datos registrados con éxito')),
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EnviarDocumentosScreen()),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Error al registrar los datos')),
                    );
                  }
                },
                child: Text('Registrar Datos'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
