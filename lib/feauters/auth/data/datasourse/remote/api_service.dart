import 'package:http/http.dart' as http;

class ApiService {
  Future<http.Response> register(Map<String, dynamic> body) async {
    final response = await http
        .post(Uri.parse('https://reqres.in/api/register'), body: body);
    return response;
  }

  Future<http.Response> login(Map<String, dynamic> body) async {
    final response = await http
        .post(Uri.parse('https://reqres.in/api/login'), body: body);
    return response;
  }
}
