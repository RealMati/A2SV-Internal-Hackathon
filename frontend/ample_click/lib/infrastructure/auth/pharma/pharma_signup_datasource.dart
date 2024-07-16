import 'dart:convert';
import 'package:ample_click/infrastructure/auth/pharma/pharma_signup_dto.dart';
import 'package:ample_click/infrastructure/core/domain.dart';
import 'package:http/http.dart' as http;

class PharmaSignupDataSource {
  final String baseUrl = Domain.url;

  Future<http.Response> signupUser(PharmaSignupDTO pharmacy) async {
    final url = Uri.parse('$baseUrl/auth/pharmacy/register');

    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': pharmacy.name,
        'email': pharmacy.email,
        'password': pharmacy.password,
      }),
    );

    return response;
  }
}
