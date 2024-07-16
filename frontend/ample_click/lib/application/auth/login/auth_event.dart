abstract class UserAuthEvent {}

abstract class PharmaAuthEvent {}

abstract class LoginPageEvent {}

class UserLoginEvent extends UserAuthEvent {
  final String email;
  final String password;

  UserLoginEvent({
    required this.email,
    required this.password,
  });
}

class PharmaLoginEvent extends PharmaAuthEvent {
  final String email;
  final String password;

  PharmaLoginEvent({
    required this.email,
    required this.password,
  });
}

class SwitchRole extends LoginPageEvent {
  final bool toValue;

  SwitchRole({required this.toValue});
}

// class ChangeLoadingStateListener extends ListenerAuthEvent {
//   final bool newLoadingState;

//   ChangeLoadingStateListener({required this.newLoadingState});
// }

class ChangeLoadingStateArtist extends PharmaAuthEvent {
  final bool newLoadingState;

  ChangeLoadingStateArtist({required this.newLoadingState});
}

class ResetErrorsArtists extends PharmaAuthEvent {}
