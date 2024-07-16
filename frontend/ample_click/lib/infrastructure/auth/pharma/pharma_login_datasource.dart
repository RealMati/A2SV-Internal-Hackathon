import 'package:ample_click/infrastructure/auth/login_dto.dart';
import 'package:ample_click/infrastructure/core/domain.dart';
import 'package:http/http.dart' as http;

class PharmaLoginDataSource {
  final String url = Domain.url;

  Future<http.Response> pharmaLogin(LoginDTO loginDto) async {
    http.Response response = await http.post(
      Uri.parse("$url/auth/pharmacy/login"),
      body: {
        "email": loginDto.email,
        "password": loginDto.password,
      },
    );

    return response;
  }
}
