import 'package:bloc/bloc.dart';
import 'package:dr_hakeem/features/register_pages/widgets/set_finger_print_view/state.dart';
import 'package:local_auth/local_auth.dart';

class SetFingerPrintCubit extends Cubit<SetFingerPrintState> {
  final LocalAuthentication auth;

  SetFingerPrintCubit(this.auth) : super(AuthInitial());

  Future<void> authenticateWithBiometrics() async {
    emit(AuthLoading());

    try {
      bool canCheck = await auth.canCheckBiometrics;
      bool isAuthenticated = false;

      if (canCheck) {
        isAuthenticated = await auth.authenticate(
          localizedReason: 'Scan your fingerprint or face to authenticate',
          options: const AuthenticationOptions(
            stickyAuth: true,
            useErrorDialogs: true,
          ),
        );
      }

      if (isAuthenticated) {
        emit(AuthSuccess());
      } else {
        emit(AuthFailure("Authentication failed"));
      }
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
}
