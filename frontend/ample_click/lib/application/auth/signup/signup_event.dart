import 'package:ample_click/domain/entities/pharmacy.dart';
import 'package:ample_click/domain/entities/user.dart';

abstract class UsersSignupEvent {}

class UserSignupEvent extends UsersSignupEvent {
  final User user;
  final String confirmPassword;

  UserSignupEvent({
    required this.user,
    required this.confirmPassword,
  });
}

class UserResetState extends UsersSignupEvent {}

abstract class PharmacySignupEvent {}

class PharmaSignupEvent extends PharmacySignupEvent {
  final Pharmacy pharmacy;
  final String confirmPassword;

  PharmaSignupEvent({
    required this.pharmacy,
    required this.confirmPassword,
  });
}

class PharmaResetState extends PharmacySignupEvent {}
