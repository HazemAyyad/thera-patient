import 'package:bloc/bloc.dart';

import 'state.dart';

class LabDetailsCubit extends Cubit<LabDetailsState> {
  LabDetailsCubit() : super(LabDetailsStateInit());
  bool isFavorite = false;
  void addFavorite() {
    isFavorite = !isFavorite;
    emit(AddFavorite());
  }
}
