import 'package:ample_click/domain/auth/interfaces/userLoginInterface.dart';
import 'package:ample_click/infrastructure/auth/login_dto.dart';
import 'package:ample_click/infrastructure/auth/login_failure.dart';
import 'package:ample_click/infrastructure/auth/login_success.dart';
import 'package:ample_click/infrastructure/auth/user/user_login_datasource.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class UserLoginRepository implements UserLoginRepositoryInterface {
  @override
  Future<Either<LoginRequestFailure, LoginRequestSuccess>> userLogin(
      LoginDTO loginDto) async {
    http.Response response = await UserLoginDataSource().userLogin(loginDto);

    if (!(response.statusCode == 200)) {
      return Left(LoginRequestFailure(message: response.body));
    }

    String token = response.headers["set-cookie"] as String;
    return Right(LoginRequestSuccess(token: token));
  }
}

// void main() async {
//   UserLoginRepository loginRepo = UserLoginRepository();
//   LoginDTO admin = LoginDTO(email: "user1@email.com", password: "1234567");
//   final res = await loginRepo.userLogin(admin);
//   res.fold((l) => (print(l.message)), (r) => print(r.token));
// }
