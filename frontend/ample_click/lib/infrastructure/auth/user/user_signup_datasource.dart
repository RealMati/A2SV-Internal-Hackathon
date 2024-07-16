import 'dart:convert';
import 'package:ample_click/infrastructure/auth/user/user_signup_dto.dart';
import 'package:ample_click/infrastructure/core/domain.dart';
import 'package:http/http.dart' as http;

class UserSignupDataSource {
  final String baseUrl = Domain.url;

  Future<http.Response> signupUser(UserSignupDTO user) async {
    final url = Uri.parse('$baseUrl/auth/user/register');

    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': user.name,
        'email': user.email,
        'password': user.password,
      }),
    );

    return response;
  }
}
