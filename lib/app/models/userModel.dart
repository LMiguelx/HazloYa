class UserModel {
  String nombre;
  String apellido;
  String email;
  String tipoUsuario;
  String pais;
  String ciudad;
  String distrito;
  String telefono;
  String password;

  UserModel({
    required this.nombre,
    required this.apellido,
    required this.email,
    required this.tipoUsuario,
    required this.pais,
    required this.ciudad,
    required this.distrito,
    required this.telefono,
    required this.password,
  });

  // Método para convertir el modelo en un mapa JSON
  Map<String, dynamic> toJson() {
    return {
      'nombre': nombre,
      'apellido': apellido,
      'email': email,
      'tipo_usuario': tipoUsuario,
      'pais': pais,
      'ciudad': ciudad,
      'distrito': distrito,
      'telefono': telefono,
      'password': password,
    };
  }
}
