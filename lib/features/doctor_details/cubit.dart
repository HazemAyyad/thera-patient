import 'package:bloc/bloc.dart';

import 'state.dart';

class DoctorDetailsCubit extends Cubit<DoctorDetailsState> {
  DoctorDetailsCubit() : super(DoctorDetailsStateInit());
   bool isFavorite = false;
  void addFavorite() {
    isFavorite = !isFavorite;
    emit(AddFavorite());
  }

}
