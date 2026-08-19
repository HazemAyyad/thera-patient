import 'package:bloc/bloc.dart';

import 'state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit() : super(HomeScreenState().init());
}
