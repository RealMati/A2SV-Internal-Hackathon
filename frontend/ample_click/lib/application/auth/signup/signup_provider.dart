import 'package:ample_click/application/auth/signup/pharma_signup_notifier.dart';
import 'package:ample_click/application/auth/signup/signup_state.dart';
import 'package:ample_click/application/auth/signup/user_signup_notifer.dart';
import 'package:ample_click/infrastructure/auth/pharma/pharma_signup_repository.dart';
import 'package:ample_click/infrastructure/auth/user/user_signup_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userSignupProvider =
    StateNotifierProvider<UserSignupNotifier, UserSignupState>((ref) {
  return UserSignupNotifier(userSignupRepo: UserSignupRepository());
});

final pharmaLoginProvider =
    StateNotifierProvider<PharmaSignupNotifier, PharmaSignupState>((ref) {
  return PharmaSignupNotifier(pharmaSignupRepo: PharmaSignupRepository());
});
