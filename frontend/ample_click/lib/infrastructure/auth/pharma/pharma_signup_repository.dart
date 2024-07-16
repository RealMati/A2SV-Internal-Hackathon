import 'dart:convert';

import 'package:ample_click/domain/auth/interfaces/pharmaSignupInterface.dart';
import 'package:ample_click/infrastructure/auth/pharma/pharma_signup_datasource.dart';
import 'package:ample_click/infrastructure/auth/pharma/pharma_signup_dto.dart';
import 'package:ample_click/infrastructure/auth/signup_failure.dart';
import 'package:ample_click/infrastructure/auth/signup_success.dart';
import 'package:dartz/dartz.dart';

class PharmaSignupRepository implements PharmaSignupRepositoryInterface {
  final PharmaSignupDataSource dataSource = PharmaSignupDataSource();

  PharmaSignupRepository();
  @override
  Future<Either<SignupRequestFailure, SignupRequestSuccess>> signupPharma(
      PharmaSignupDTO pharma) async {
    final res = await dataSource.signupPharma(pharma);

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
//   PharmaSignupRepository PharmaSignupRepository = PharmaSignupRepository();
//   UserSignupDTO user = UserSignupDTO(
//       name: "user2",
//       email: "user2@email.com",
//       password: "1234567",
//       confirmPassword: "1234567");

//   final res = await PharmaSignupRepository.signupUser(user);
//   res.fold((l) => (print(l.message)), (r) => print("User created"));
// }
