import 'package:flutter/material.dart';

class EnviarDocumentosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enviar Documentos'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Text(
          'Aquí puedes enviar tus documentos PDF',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
