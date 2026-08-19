import 'package:bloc/bloc.dart';
import 'package:dr_hakeem/core/routing/page_router.dart';
import 'package:dr_hakeem/features/bottom_navigation_bar/view.dart';
import 'package:dr_hakeem/features/register_pages/widgets/face_id/widgets/biometric_helper.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:local_auth/local_auth.dart';
import 'state.dart';

class FaceIDCubit extends Cubit<FaceIDState> {
  final LocalAuthentication auth;

  FaceIDCubit(this.auth) : super(FaceIDInitial());

  Future<void> authenticateFaceId() async {
    if (!await BiometricHelper.isBiometricSupported()) {
      Fluttertoast.showToast(msg: "Device does not support biometrics.");
      return;
    }

    final availableBiometrics = await BiometricHelper.getAvailableBiometrics();
    if (availableBiometrics.isEmpty) {
      Fluttertoast.showToast(msg: "No biometrics found. Please set it up.");
      return;
    }

    final bool didAuthenticate = await BiometricHelper.authenticate();
    if (didAuthenticate) {
      emit(FaceIDSuccess());
      MagicRouter.navigateTo(BottomNavigationBarPage());
    } else {
      emit(FaceIDFailure("Authentication Failed"));
    }
  }
}
