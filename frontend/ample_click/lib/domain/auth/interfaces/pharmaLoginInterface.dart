import 'package:ample_click/infrastructure/auth/login_dto.dart';
import 'package:ample_click/infrastructure/auth/login_failure.dart';
import 'package:ample_click/infrastructure/auth/login_success.dart';
import 'package:dartz/dartz.dart';

abstract class PharmaLoginRepositoryInterface {
  Future<Either<LoginRequestFailure, LoginRequestSuccess>> pharmaLogin(
      LoginDTO loginDto);
}
