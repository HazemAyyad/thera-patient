import 'package:bloc/bloc.dart';

import 'state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchStateInit());
  String? selectedGender;

  void onChanged(String? value) {
    selectedGender = value;
    emit(OnChange());
  }
}
