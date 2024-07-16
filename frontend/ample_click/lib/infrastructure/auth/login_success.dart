import 'package:ample_click/domain/core.dart';

class LoginRequestSuccess implements Success {
  final String token;
  LoginRequestSuccess({required this.token});
}
