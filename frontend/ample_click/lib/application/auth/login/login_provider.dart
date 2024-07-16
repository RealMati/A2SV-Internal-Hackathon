import 'package:ample_click/application/auth/login/auth_state.dart';
import 'package:ample_click/application/auth/login/phrama_login_notifier.dart';
import 'package:ample_click/application/auth/login/user_login_notifier.dart';
import 'package:ample_click/infrastructure/auth/pharma/pharma_login_repository.dart';
import 'package:ample_click/infrastructure/auth/user/user_login_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userLoginProvider =
    StateNotifierProvider<UserAuthNotifier, UserAuthState>((ref) {
  return UserAuthNotifier(userLoginRepo: UserLoginRepository());
});

final pharmaLoginProvider =
    StateNotifierProvider<PharmaAuthNotifier, PharmaAuthState>((ref) {
  return PharmaAuthNotifier(pharmaLoginRepo: PharmaLoginRepository());
});
