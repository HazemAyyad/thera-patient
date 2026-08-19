import 'package:bloc/bloc.dart';

import 'state.dart';

class SaveMyLifeCubit extends Cubit<SaveMyLifeState> {
  SaveMyLifeCubit() : super(SaveMyLifeState().init());
}
