import 'dart:convert';

import 'package:ample_click/domain/auth/interfaces/pharmaLoginInterface.dart';
import 'package:ample_click/domain/auth/interfaces/userLoginInterface.dart';
import 'package:ample_click/infrastructure/auth/login_dto.dart';
import 'package:dartz/dartz.dart';
import 'package:email_validator/email_validator.dart';
import 'package:ample_click/domain/auth/login/login_failure.dart';
import 'package:ample_click/domain/auth/login/login_success.dart';

class UserAuthEntity {
  final String email;
  final String password;
  late String token;
  final UserLoginRepositoryInterface userLoginRepo;

  UserAuthEntity(
      {required this.email,
      required this.password,
      required this.userLoginRepo});

  Future<Either<LoginFailure, LoginSuccess>> loginUser() async {
    LoginFailure loginFailure = LoginFailure();
    if (password.length < 6) {
      loginFailure.messages.add("The password is too short");
    }

    if (!EmailValidator.validate(email)) {
      loginFailure.messages.add("Invalid Email");
    }

    if (loginFailure.messages.isNotEmpty) {
      return Left(loginFailure);
    }

    final res = await userLoginRepo
        .userLogin(LoginDTO(email: email, password: password));

    return res.fold((l) {
      if (l.message.startsWith('{"')) {
        loginFailure.messages.add(jsonDecode(l.message)["message"]);
        return Left(loginFailure);
      }
      loginFailure.messages.add(l.message == "Conflict"
          ? "Incorrect email or password"
          : "Connection Error");
      return Left(loginFailure);
    }, (r) {
      token = r.token;
      return Right(LoginSuccess(token: r.token));
    });
  }
}

class PharmaAuthEntity {
  final String email;
  final String password;
  final PharmaLoginRepositoryInterface pharmaLoginRepo;

  PharmaAuthEntity(
      {required this.email,
      required this.password,
      required this.pharmaLoginRepo});

  Future<Either<LoginFailure, LoginSuccess>> loginPharma() async {
    LoginFailure loginFailure = LoginFailure();

    if (!EmailValidator.validate(email)) {
      loginFailure.messages.add("Invalid Email");
    }

    if (password.length < 6) {
      loginFailure.messages.add("The password is too short");
    }

    if (loginFailure.messages.isNotEmpty) {
      return Left(loginFailure);
    }

    final res = await pharmaLoginRepo
        .pharmaLogin(LoginDTO(email: email, password: password));

    return res.fold((l) {
      if (l.message.startsWith('{"')) {
        loginFailure.messages.add(jsonDecode(l.message)["message"]);
        return Left(loginFailure);
      }
      loginFailure.messages.add(l.message == "Conflict"
          ? "Incorrect email or password"
          : "Connection Error");
      return Left(loginFailure);
    }, (r) {
      return Right(LoginSuccess(token: r.token));
    });
  }
}
