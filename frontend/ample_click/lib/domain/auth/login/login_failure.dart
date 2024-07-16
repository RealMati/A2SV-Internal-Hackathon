import 'package:ample_click/domain/core.dart';

class LoginFailure implements Failure {
  List<String> messages = [];

  @override
  String get message => throw UnimplementedError();
}
