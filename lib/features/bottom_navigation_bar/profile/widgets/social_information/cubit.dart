import 'package:bloc/bloc.dart';

import 'state.dart';

class SocialInformationCubit extends Cubit<SocialInformationState> {
  SocialInformationCubit() : super(SocialInformationStateInit());
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
