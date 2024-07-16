class PharmaAuthState {
  String token = "";
  List<String> errors = [];
  bool isLoading = false;

  PharmaAuthState({this.isLoading = false});
}

class UserAuthState {
  String token = "";
  List<String> errors = [];
  bool isLoading = false;

  UserAuthState({this.isLoading = false});
}
