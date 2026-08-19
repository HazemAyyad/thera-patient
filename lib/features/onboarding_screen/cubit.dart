import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'state.dart';

class OnboardingScreenCubit extends Cubit<OnboardingScreenState> {
  OnboardingScreenCubit() : super(OnboardingScreenState().init());
  final PageController pageController = PageController();

}
