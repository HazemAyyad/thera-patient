import 'package:dr_hakeem/core/routing/page_router.dart' show MagicRouter;
import 'package:dr_hakeem/core/shared_widgets/custom_button.dart';
import 'package:dr_hakeem/core/shared_widgets/custom_no_colored_button.dart';
import 'package:dr_hakeem/core/theming/colors.dart';
import 'package:dr_hakeem/core/theming/styles.dart';
import 'package:dr_hakeem/features/login/view.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../register_pages/first_register_screen/view.dart';

class OnboardingThirdScreen extends StatelessWidget {
  final PageController controller;

  const OnboardingThirdScreen({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
          children: [
            InkWell(
              onTap: () {
                MagicRouter.navigateTo(FirstRegisterPage());
              },
              child: Text("تخطي", style: TextStyles.font16Weight400Green),
            ),
            SizedBox(height: 80.h),

            Image.asset(
              "assets/images/Group 2.png",
              width: 300.w,
              height: 300.w,
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
              "المتابعة الصحية",
              textAlign: TextAlign.center,
              style: TextStyles.font20Weight700Black,
            ),

            SizedBox(height: 20.h),

            Text(
              "يتم تنبيهك عند كل حبة دواء",
              textAlign: TextAlign.center,
              style: TextStyles.font15Weight400DarkGrey,
            ),

            SizedBox(height: 45.h),

            CustomButton(
              text: "تسجيل الدخول",
              onPressed: () => MagicRouter.navigateTo(LoginPage()),
            ),

            SizedBox(height: 20.h),

            CustomNoColoredButton(
              text: "إنشاء حساب جديد",
              onPressed: () => MagicRouter.navigateTo(FirstRegisterPage()),
            ),
          ],
        ),
      ),
    );
  }
}
