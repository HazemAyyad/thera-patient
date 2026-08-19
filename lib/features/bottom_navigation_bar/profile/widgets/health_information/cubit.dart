import 'package:bloc/bloc.dart';

import 'state.dart';

class HealthInformationCubit extends Cubit<HealthInformationState> {
  HealthInformationCubit() : super(HealthInformationStateInit());

  String? selectedGenderBloodGroups;

  void onChangedBloodGroups(String? value) {
    selectedGenderBloodGroups = value;
    emit(OnChangeBloodGroups());
  }
}
