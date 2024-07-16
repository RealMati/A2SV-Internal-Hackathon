import 'package:ample_click/domain/core.dart';

class LoginSuccess extends Success {
  final String token;

  LoginSuccess({required this.token});
}
