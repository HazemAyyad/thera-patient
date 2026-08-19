import 'package:bloc/bloc.dart';

import 'state.dart';

class PharmacyDetailsCubit extends Cubit<PharmacyDetailsState> {
  PharmacyDetailsCubit() : super(PharmacyDetailsStateInit());
  bool isFavorite = false;
  void addFavorite() {
    isFavorite = !isFavorite;
    emit(AddFavorite());
  }
}
