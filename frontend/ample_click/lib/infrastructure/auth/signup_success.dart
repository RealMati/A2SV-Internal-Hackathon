import 'package:ample_click/domain/core.dart';

class SignupRequestFailure implements Failure {
  @override
  final String message;

  SignupRequestFailure({required this.message});
}
