import 'package:ample_click/infrastructure/auth/pharma/pharma_signup_dto.dart';
import 'package:ample_click/infrastructure/auth/signup_failure.dart';
import 'package:ample_click/infrastructure/auth/signup_success.dart';
import 'package:dartz/dartz.dart';

abstract class PharmaSignupRepositoryInterface {
  Future<Either<SignupRequestFailure, SignupRequestSuccess>> signupPharma(
      PharmaSignupDTO pharmacy);
}
