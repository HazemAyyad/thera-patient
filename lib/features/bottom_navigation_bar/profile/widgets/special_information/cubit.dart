import 'package:bloc/bloc.dart';

import 'state.dart';

class SpecialInformationCubit extends Cubit<SpecialInformationState> {
  SpecialInformationCubit() : super(SpecialInformationState().init());
}
