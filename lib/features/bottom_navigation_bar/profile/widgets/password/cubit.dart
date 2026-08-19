import 'package:bloc/bloc.dart';

import 'state.dart';

class PasswordCubit extends Cubit<PasswordState> {
  PasswordCubit() : super(PasswordState().init());
}
