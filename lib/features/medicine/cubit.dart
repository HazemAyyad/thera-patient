import 'package:bloc/bloc.dart';

import 'state.dart';

class MedicineCubit extends Cubit<MedicineState> {
  MedicineCubit() : super(MedicineStateInit());
  String? selectedPeriod;

  void onChangedPeriod(String? value) {
    selectedPeriod = value;
    emit(OnChange());
  }
}
