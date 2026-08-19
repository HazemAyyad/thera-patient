import 'package:bloc/bloc.dart';

import 'state.dart';

class SecondRegisterScreenCubit extends Cubit<SecondRegisterScreenState> {
  SecondRegisterScreenCubit() : super(SecondRegisterScreenStateInit());
  String? selectedGender;

  void onChanged(String? value) {
    selectedGender = value;
    emit(OnChange());
  }
  String? selectedGenderGovernorate;

  void onChangedGovernorate(String? value) {
    selectedGenderGovernorate = value;
    emit(OnChangeGovernorate());
  }
  String? selectedGenderSocialState;

  void onChangedSocialState(String? value) {
    selectedGenderSocialState = value;
    emit(OnChangeSocialState());
  }
}


