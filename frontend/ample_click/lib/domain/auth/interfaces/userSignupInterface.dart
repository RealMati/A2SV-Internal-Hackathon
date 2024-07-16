import 'package:ample_click/infrastructure/auth/signup_failure.dart';
import 'package:ample_click/infrastructure/auth/signup_success.dart';
import 'package:ample_click/infrastructure/auth/user/user_signup_dto.dart';
import 'package:dartz/dartz.dart';

abstract class UserSignupRepositoryInterface {
  Future<Either<SignupRequestFailure, SignupRequestSuccess>> signupUser(
      UserSignupDTO pharmacy);
}
