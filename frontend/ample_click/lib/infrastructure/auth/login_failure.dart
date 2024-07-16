import 'package:ample_click/domain/core.dart';

class LoginRequestFailure implements Failure {
  @override
  final String message;

  LoginRequestFailure({required this.message});
}
