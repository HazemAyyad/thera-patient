import 'package:bloc/bloc.dart';

import 'state.dart';

class FirstRegisterCubit extends Cubit<FirstRegisterState> {
  FirstRegisterCubit() : super(FirstRegisterState().init());
}
