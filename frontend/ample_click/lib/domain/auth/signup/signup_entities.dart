import 'package:ample_click/domain/auth/interfaces/pharmaSignupInterface.dart';
import 'package:ample_click/domain/auth/interfaces/userSignupInterface.dart';
import 'package:ample_click/domain/auth/signup/signup_failure.dart';
import 'package:ample_click/domain/auth/signup/signup_success.dart';
import 'package:ample_click/infrastructure/auth/pharma/pharma_signup_dto.dart';
import 'package:ample_click/infrastructure/auth/user/user_signup_dto.dart';
import 'package:dartz/dartz.dart';
import 'package:email_validator/email_validator.dart';

class UserSignupEntity {
  final UserSignupRepositoryInterface signupRepository;
  final UserSignupDTO user;

  UserSignupEntity({
    required this.user,
    required this.signupRepository,
  });

  Future<Either<SignupFailure, SignupSuccess>> signupUser() async {
    SignupFailure signupFailure = SignupFailure();

    if (user.name.isEmpty) {
      signupFailure.messages.add("Username can not be empty");
    }

    if (!EmailValidator.validate(user.email)) {
      signupFailure.messages.add("Invalid Email");
    }

    if (user.password.length < 6) {
      signupFailure.messages.add("The password is too short");
    }

    if (user.password != user.confirmPassword) {
      signupFailure.messages.add("The passwords don't match");
    }

    if (signupFailure.messages.isNotEmpty) {
      return Left(signupFailure);
    }

    final res = await signupRepository.signupUser(user);

    return res.fold((l) {
      signupFailure.messages.add(
          l.message == "Account with the provided email already exists"
              ? l.message
              : "Signup failed. Please try again");
      return Left(signupFailure);
    }, (r) {
      return Right(SignupSuccess());
    });
  }
}

class PharmaSignupEntity {
  final PharmaSignupRepositoryInterface signupRepository;
  final PharmaSignupDTO pharmacy;

  PharmaSignupEntity({
    required this.pharmacy,
    required this.signupRepository,
  });

  Future<Either<SignupFailure, SignupSuccess>> signupPharma() async {
    SignupFailure signupFailure = SignupFailure();

    if (pharmacy.name.isEmpty) {
      signupFailure.messages.add("Username can not be empty");
    }

    if (!EmailValidator.validate(pharmacy.email)) {
      signupFailure.messages.add("Invalid Email");
    }

    if (pharmacy.password.length < 6) {
      signupFailure.messages.add("The password is too short");
    }

    if (pharmacy.password != pharmacy.confirmPassword) {
      signupFailure.messages.add("The passwords don't match");
    }

    if (signupFailure.messages.isNotEmpty) {
      return Left(signupFailure);
    }

    final res = await signupRepository.signupPharma(pharmacy);

    return res.fold((l) {
      signupFailure.messages.add(
          l.message == "Account with the provided email already exists"
              ? l.message
              : "Signup failed. Please try again");
      return Left(signupFailure);
    }, (r) {
      return Right(SignupSuccess());
    });
  }
}
