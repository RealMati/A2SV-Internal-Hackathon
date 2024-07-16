import 'package:ample_click/application/auth/signup/signup_state.dart';
import 'package:ample_click/domain/auth/interfaces/pharmaSignupInterface.dart';
import 'package:ample_click/domain/auth/signup/signup_entities.dart';
import 'package:ample_click/infrastructure/auth/pharma/pharma_signup_dto.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PharmaSignupNotifier extends StateNotifier<PharmaSignupState> {
  final PharmaSignupRepositoryInterface pharmaSignupRepo;

  PharmaSignupNotifier({required this.pharmaSignupRepo})
      : super(SignupInitialPharma());
  Future<void> artistSignup(PharmaSignupDTO pharmaDto) async {
    final res = await PharmaSignupEntity(
            pharmacy: pharmaDto, signupRepository: pharmaSignupRepo)
        .signupPharma();

    res.fold((l) {
      if (l.messages.isNotEmpty) {
        state = PharmaSignupFailure(error: l.messages[0]);
      } else {
        state =
            const PharmaSignupFailure(error: "Signup failed. Please try again");
      }
    }, (r) {
      state = PharmaSignupSuccess();
    });
  }

  void resetState() {
    state = SignupInitialPharma();
  }
}
