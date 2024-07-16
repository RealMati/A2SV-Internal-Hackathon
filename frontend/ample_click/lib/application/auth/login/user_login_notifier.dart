import 'package:ample_click/domain/auth/login/login_entities.dart';
import 'package:ample_click/infrastructure/core/secure_storage_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ample_click/application/auth/login/auth_state.dart';
import 'package:ample_click/domain/auth/interfaces/userLoginInterface.dart';

class UserAuthNotifier extends StateNotifier<UserAuthState> {
  final UserLoginRepositoryInterface userLoginRepo;

  UserAuthNotifier({required this.userLoginRepo}) : super(UserAuthState());

  Future<void> loginUser(String email, String password) async {
    final res = await UserAuthEntity(
            email: email, password: password, userLoginRepo: userLoginRepo)
        .loginUser();

    await res.fold((l) {
      UserAuthState newState = UserAuthState();
      newState.errors = l.messages;
      state = newState;
    }, (r) async {
      UserAuthState newState = UserAuthState();
      await SecureStorageService().writeToken(r.token);
      newState.token = r.token;
      state = newState;
    });
  }

  void clearErrors() {
    state = UserAuthState();
  }
}
