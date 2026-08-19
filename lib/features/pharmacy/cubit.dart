import 'package:bloc/bloc.dart';

import 'state.dart';

class PharmacyCubit extends Cubit<PharmacyState> {
  PharmacyCubit() : super(PharmacyStateInit());
  String? selectedGender;

  void onChanged(String? value) {
    selectedGender = value;
    emit(OnChange());
  }
}
