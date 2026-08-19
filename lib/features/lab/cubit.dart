import 'package:bloc/bloc.dart';

import 'state.dart';

class LabCubit extends Cubit<LabState> {
  LabCubit() : super(LabStateInit());
  String? selectedGender;

  void onChanged(String? value) {
    selectedGender = value;
    emit(OnChange());
  }
}
