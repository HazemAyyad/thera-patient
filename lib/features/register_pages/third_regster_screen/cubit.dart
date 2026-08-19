import 'package:bloc/bloc.dart';

import 'state.dart';

class ThirdRegsterScreenCubit extends Cubit<ThirdRegsterScreenState> {
  ThirdRegsterScreenCubit() : super(ThirdRegsterScreenStateInit());
  String? selectedGenderBloodGroups;

  void onChangedBloodGroups(String? value) {
    selectedGenderBloodGroups = value;
    emit(OnChangeBloodGroups());
  }
}
