import 'package:ample_click/application/auth/signup/signup_state.dart';
import 'package:ample_click/domain/auth/interfaces/userSignupInterface.dart';
import 'package:ample_click/domain/auth/signup/signup_entities.dart';
import 'package:ample_click/infrastructure/auth/user/user_signup_dto.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserSignupNotifier extends StateNotifier<UserSignupState> {
  final UserSignupRepositoryInterface artistSignupRepo;

  UserSignupNotifier({required this.artistSignupRepo})
      : super(SignupInitialUser());
  Future<void> userSignup(UserSignupDTO artistDto) async {
    final res = await UserSignupEntity(
            user: artistDto, signupRepository: artistSignupRepo)
        .signupUser();

    res.fold((l) {
      if (l.messages.isNotEmpty) {
        state = UserSignupFailure(error: l.messages[0]);
      } else {
        state =
            const UserSignupFailure(error: "Signup failed. Please try again");
      }
    }, (r) {
      state = UserSignupSuccess();
    });
  }

  void resetState() {
    state = SignupInitialUser();
  }
}
