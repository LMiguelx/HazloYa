import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hazloya/app/models/userModel.dart';

class RegisterService {
  final String apiUrl = 'http://localhost:3000/api/users/register';

  Future<bool> registerUser(UserModel user) async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode(user.toJson()),
      );

      return response.statusCode == 200 || response.statusCode == 201;
    } catch (e) {
      print('Error de conexión: $e');
      return false;
    }
  }
}
