import 'package:flutter_bloc/flutter_bloc.dart';
import 'state.dart';

class CalenderCubit extends Cubit<CalenderState> {
  CalenderCubit()
      : super(CalenderState.initial().copyWith(
    availableDays: [
      DateTime(2025, 11, 6),
      DateTime(2025, 11, 13),
      DateTime(2025, 11, 21),
    ],
    unavailableDays: [
      DateTime(2025, 11, 10),
      DateTime(2025, 11, 17),
      DateTime(2025, 11, 24),
    ],
  ));

  void selectDate(DateTime date) {
    emit(state.copyWith(selectedDate: date, focusedDate: date));
  }

  void changeMonth(DateTime newFocused) {
    emit(state.copyWith(focusedDate: newFocused));
  }
}
