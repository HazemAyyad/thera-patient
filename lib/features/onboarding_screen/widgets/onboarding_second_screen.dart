import 'package:dr_hakeem/core/routing/page_router.dart';
import 'package:dr_hakeem/core/shared_widgets/custom_button.dart';
import 'package:dr_hakeem/core/theming/colors.dart';
import 'package:dr_hakeem/core/theming/styles.dart';
import 'package:dr_hakeem/features/onboarding_screen/widgets/onboarding_third_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../register_pages/first_register_screen/view.dart' show FirstRegisterPage;

class OnboardingSecondScreen extends StatelessWidget {
  final PageController controller;
  const OnboardingSecondScreen({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
          children: [
            InkWell(
              onTap: () =>
        Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => FirstRegisterPage()),
      ),

              child: Text(
                "تخطي",
                style: TextStyles.font16Weight400Green,
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(height: 80.h),
            Center(
              child: Image.asset(
                "assets/images/list_image.png",
                width: 300.w,
                height: 300.w,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 70.h),
            Center(
              child: SmoothPageIndicator(
                controller: controller,
                count: 3,
                effect: CustomizableEffect(
                  activeDotDecoration: DotDecoration(
                    width: 9.w,
                    height: 21.h,
                    color: AppColors.blueColor,
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  dotDecoration: DotDecoration(
                    width: 9.w,
                    height: 16.h,
                    color: AppColors.greyColor,
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  spacing: 15.w,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              "سجل طبي لكل مريض",
              textAlign: TextAlign.center,
              style: TextStyles.font20Weight700Black,
            ),
            SizedBox(height: 20.h),
            Text(
              "يتم حفظ المعلومات المرضية الخاصة بك في سجلك المرضي",
              textAlign: TextAlign.center,
              style: TextStyles.font15Weight400DarkGrey,
            ),
            SizedBox(height: 23.h),
            CustomButton(
              text: "التالي",
              onPressed: () {
                if ((controller.page ?? 0) >= 2) {
                  MagicRouter.navigateTo(
                    OnboardingThirdScreen(controller: controller),
                  );
                } else {
                  controller.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.ease,
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
