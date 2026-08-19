import 'package:dr_hakeem/features/onboarding_screen/cubit.dart';
import 'package:dr_hakeem/features/onboarding_screen/state.dart';
import 'package:dr_hakeem/features/onboarding_screen/widgets/onboarding_first_screen.dart';
import 'package:dr_hakeem/features/onboarding_screen/widgets/onboarding_second_screen.dart';
import 'package:dr_hakeem/features/onboarding_screen/widgets/onboarding_third_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingScreensPage extends StatelessWidget {
  const OnBoardingScreensPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => OnboardingScreenCubit(),
      child: Scaffold(
        body: BlocBuilder<OnboardingScreenCubit, OnboardingScreenState>(
          builder: (context, state) {
            final controller = BlocProvider.of<OnboardingScreenCubit>(context);
            return Column(
              children: [
                Expanded(
                  child: PageView(
                    controller: controller.pageController,
                    scrollDirection: Axis.horizontal,
                    children: [
                      OnboardingFirstScreen(
                        controller: controller.pageController,
                      ),
                      OnboardingSecondScreen(
                        controller: controller.pageController,
                      ),
                      OnboardingThirdScreen(
                        controller: controller.pageController,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
              ],
            );
          },
        ),
      ),
    );
  }
}
