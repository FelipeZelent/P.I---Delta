import 'dart:convert';
import 'package:http/http.dart' as http;

class APIService {
  static Future<Map<String, dynamic>> login(
      String username, String password) async {
    final url = Uri.parse('https://fakestoreapi.com/auth/login');
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({
      'username': username,
      'password': password,
    });

    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception('Falha no login. Verifique o nome de usuário e a senha.');
    }
  }
}