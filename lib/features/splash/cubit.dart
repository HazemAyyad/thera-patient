import 'package:dr_hakeem/core/routing/page_router.dart';
import 'package:dr_hakeem/features/onboarding_screen/view.dart';
import 'package:dr_hakeem/features/splash/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashStateInit());

  double scale = 0.4;
  double logoSize = 80;
  Color backgroundColor = const Color(0xFF00A99D);

  Future<void> startAnimation(BuildContext context) async {
    await Future.delayed(const Duration(milliseconds: 400));
    scale = 0.8;
    logoSize = 100;
    emit(SplashStateUpdated());

    await Future.delayed(const Duration(milliseconds: 600));
    scale = 1.2;
    logoSize = 130;
    emit(SplashStateUpdated());

    await Future.delayed(const Duration(milliseconds: 800));
    scale = 1.6;
    logoSize = 160;
    emit(SplashStateUpdated());

    await Future.delayed(const Duration(milliseconds: 700));
    backgroundColor = Colors.white;
    emit(SplashStateUpdated());

    await Future.delayed(const Duration(seconds: 1));
    if (context.mounted) {

      MagicRouter.navigateTo(OnBoardingScreensPage());
    }
  }
}
