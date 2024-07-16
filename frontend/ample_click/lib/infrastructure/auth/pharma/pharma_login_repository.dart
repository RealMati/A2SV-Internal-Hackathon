import 'package:ample_click/domain/auth/interfaces/pharmaLoginInterface.dart';
import 'package:ample_click/infrastructure/auth/login_dto.dart';
import 'package:ample_click/infrastructure/auth/login_failure.dart';
import 'package:ample_click/infrastructure/auth/login_success.dart';
import 'package:ample_click/infrastructure/auth/pharma/pharma_login_datasource.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class PharmaLoginRepository implements PharmaLoginRepositoryInterface {
  @override
  Future<Either<LoginRequestFailure, LoginRequestSuccess>> pharmaLogin(
      LoginDTO loginDto) async {
    http.Response response =
        await PharmaLoginDataSource().pharmaLogin(loginDto);

    if (!(response.statusCode == 200)) {
      return Left(LoginRequestFailure(message: response.body));
    }

    String token = response.headers["set-cookie"] as String;
    return Right(LoginRequestSuccess(token: token));
  }
}


// void main() async {
//   LoginDataSource loginRepo = LoginDataSource();
//   LoginDTO admin = LoginDTO(email: "admin123@gmail.com", password: "admin13");
//   final res = await loginRepo.adminLogin(admin);
//   res.fold((l) => (print(l.message)), (r) => print(r.token));
// }