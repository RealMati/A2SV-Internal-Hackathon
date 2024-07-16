import 'package:ample_click/infrastructure/auth/login_dto.dart';
import 'package:ample_click/infrastructure/core/domain.dart';
import 'package:http/http.dart' as http;

class UserLoginDataSource {
  final String url = Domain.url;

  Future<http.Response> userLogin(LoginDTO loginDto) async {
    http.Response response = await http.post(
      Uri.parse("$url/auth/user/login"),
      body: {
        "email": loginDto.email,
        "password": loginDto.password,
      },
    );

    return response;
  }
}
