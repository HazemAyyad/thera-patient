import 'package:dr_hakeem/core/shared_widgets/custom_button.dart';
import 'package:dr_hakeem/features/home_screen/view.dart';
import 'package:dr_hakeem/features/register_pages/first_register_screen/view.dart';
import 'package:flutter/gestures.dart' show TapGestureRecognizer;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/routing/page_router.dart';
import '../../core/shared_widgets/custom_text_form_feild.dart';
import '../../core/theming/colors.dart';
import '../../core/theming/styles.dart';
import '../bottom_navigation_bar/view.dart' show BottomNavigationBarPage;
import 'cubit.dart';
import 'state.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: Scaffold(
        body: SafeArea(
          child: ListView(

            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
            children: [
              Image.asset(
                "assets/images/second_logo.png",
                width: 72.w,
                height: 82.h,
              ),
              SizedBox(height: 20.h),
              Text(
                textAlign: TextAlign.end,
                "تسجيل الدخول",
                style: TextStyles.font20Weight700Black,
              ),
              SizedBox(height: 20.h),

              CustomTextFormFeild(
                // width: 345.w,
                // height: 85.h,
                radius: 8.sp,
                fillColor: AppColors.babyBlueColor,
                upperText: "البريد الإلكتروني",
                starText: "",
                hint: "مثال: zmohamed@mail.com",
              ),
               SizedBox(height: 10.h),
              CustomTextFormFeild(
                // width: 345.w,
                // height: 48.h,
                radius: 8.sp,
                fillColor: AppColors.babyBlueColor,
                upperText: "كلمة المرور",
                starText: "",
                hint: "**********",
                textDirection: TextDirection.ltr,
              ),
              SizedBox(height: 40.h),
              CustomButton(
                text: "تسجيل الدخول",
                onPressed: () {
                  MagicRouter.navigateTo(BottomNavigationBarPage());
                },
              ),
              SizedBox(height: 20.h),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyles.font16Weight400Black,
                  children: [
                    TextSpan(text: "ليس لديك حساب؟"),
                    TextSpan(
                      text: "سجل الآن",
                      style: TextStyles.font20Weight700BlueColor,
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          MagicRouter.navigateTo(FirstRegisterPage());
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
