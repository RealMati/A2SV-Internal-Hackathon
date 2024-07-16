import 'package:equatable/equatable.dart';

abstract class UserSignupState extends Equatable {
  const UserSignupState();

  @override
  List<Object> get props => [];
}

class SignupInitialUser extends UserSignupState {}

class SignupLoadingUser extends UserSignupState {}

class UserSignupSuccess extends UserSignupState {}

class UserSignupFailure extends UserSignupState {
  final String error;

  const UserSignupFailure({required this.error});
}

abstract class PharmaSignupState extends Equatable {
  const PharmaSignupState();

  @override
  List<Object> get props => [];
}

class SignupInitialPharma extends PharmaSignupState {}

class SignupLoadingPharma extends PharmaSignupState {}

class PharmaSignupSuccess extends PharmaSignupState {}

class PharmaSignupFailure extends PharmaSignupState {
  final String error;

  const PharmaSignupFailure({required this.error});

  @override
  List<Object> get props => [error];
}
