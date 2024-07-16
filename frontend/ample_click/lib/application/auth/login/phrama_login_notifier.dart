import 'package:ample_click/domain/auth/interfaces/pharmaLoginInterface.dart';
import 'package:ample_click/domain/auth/login/login_entities.dart';
import 'package:ample_click/infrastructure/core/secure_storage_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ample_click/application/auth/login/auth_state.dart';

class PharmaAuthNotifier extends StateNotifier<PharmaAuthState> {
  final PharmaLoginRepositoryInterface pharmaLoginRepo;

  PharmaAuthNotifier({required this.pharmaLoginRepo})
      : super(PharmaAuthState());

  Future<void> loginPharma(String email, String password) async {
    final res = await PharmaAuthEntity(
            email: email, password: password, pharmaLoginRepo: pharmaLoginRepo)
        .loginPharma();

    await res.fold((l) {
      PharmaAuthState newState = PharmaAuthState();
      newState.errors = l.messages;
      state = newState;
    }, (r) async {
      PharmaAuthState newState = PharmaAuthState();
      await SecureStorageService().writeToken(r.token);
      newState.token = r.token;
      state = newState;
    });
  }

  void clearErrors() {
    state = PharmaAuthState();
  }
}
