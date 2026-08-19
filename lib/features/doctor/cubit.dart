import 'package:bloc/bloc.dart';

import 'state.dart';

class DoctorCubit extends Cubit<DoctorState> {
  DoctorCubit() : super(DoctorStateInit());
  String? selectedGender;

  void onChanged(String? value) {
    selectedGender = value;
    emit(OnChange());
  }
}
