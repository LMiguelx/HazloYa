import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart'; // Paquete para seleccionar archivos
import 'dart:io'; // Para trabajar con archivos

class EnviarDocumentosScreen extends StatefulWidget {
  @override
  _EnviarDocumentosScreenState createState() => _EnviarDocumentosScreenState();
}

class _EnviarDocumentosScreenState extends State<EnviarDocumentosScreen> {
  File? selectedFile;

  // Método para seleccionar un archivo PDF
  Future<void> _selectFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      setState(() {
        selectedFile = File(result.files.single.path!);
      });
    }
  }

  // Método para enviar el archivo PDF
  Future<void> _sendFile() async {
    if (selectedFile != null) {

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Documento enviado con éxito')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor, selecciona un documento PDF')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enviar Documentos'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Selecciona un archivo PDF para enviar:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _selectFile,
              child: Text('Seleccionar PDF'),
            ),
            SizedBox(height: 20),
            if (selectedFile != null)
              Text(
                  'Archivo seleccionado: ${selectedFile!.path.split('/').last}'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _sendFile,
              child: Text('Enviar Documento'),
            ),
          ],
        ),
      ),
    );
  }
}
