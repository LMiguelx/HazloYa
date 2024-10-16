import 'package:flutter/material.dart';

class RegistrarDatosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '¡Bienvenido!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                'En este apartado , registraremos tus datos',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40), // Espacio entre el texto y el formulario
              TextField(
                decoration: InputDecoration(
                  labelText: 'DNI',
                  border: OutlineInputBorder(),
                  hintText: 'Ingresa tu DNI',
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20), // Espacio entre campos
              ElevatedButton(
                onPressed: () {},
                child: Text('Subir Documento PDF'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Nota: Los pds subidos tendran que contener tus antecedentes penales y tendran un periodo de revision xD.',
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
