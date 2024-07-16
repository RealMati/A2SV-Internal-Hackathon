import 'dart:convert';

import 'package:ample_click/domain/auth/interfaces/userSignupInterface.dart';
import 'package:ample_click/infrastructure/auth/signup_failure.dart';
import 'package:ample_click/infrastructure/auth/signup_success.dart';
import 'package:ample_click/infrastructure/auth/user/user_signup_datasource.dart';
import 'package:ample_click/infrastructure/auth/user/user_signup_dto.dart';
import 'package:dartz/dartz.dart';

class UserSignupRepository implements UserSignupRepositoryInterface {
  final UserSignupDataSource dataSource = UserSignupDataSource();

  UserSignupRepository();
  @override
  Future<Either<SignupRequestFailure, SignupRequestSuccess>> signupUser(
      UserSignupDTO artist) async {
    final res = await dataSource.signupUser(artist);

    if (res.statusCode == 500) {
      return Left(SignupRequestFailure(
          message: "There is an account associated with that email"));
    }

    if (res.statusCode != 201) {
      final decodedRes = jsonDecode(res.body);
      return Left(SignupRequestFailure(message: decodedRes["message"]));
    }

    return Right(SignupRequestSuccess());
  }
}

// void main() async {
//   UserSignupRepository userSignupRepository = UserSignupRepository();
//   UserSignupDTO user = UserSignupDTO(
//       name: "user2",
//       email: "user2@email.com",
//       password: "1234567",
//       confirmPassword: "1234567");

//   final res = await userSignupRepository.signupUser(user);
//   res.fold((l) => (print(l.message)), (r) => print("User created"));
// }
