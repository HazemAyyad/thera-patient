import 'package:dr_hakeem/core/routing/page_router.dart';
import 'package:dr_hakeem/core/shared_widgets/custom_button.dart';
import 'package:dr_hakeem/core/shared_widgets/custom_text_form_feild.dart';
import 'package:dr_hakeem/features/login/view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theming/colors.dart';
import '../../../core/theming/styles.dart';

import '../second_register_screen/view.dart' show SecondRegisterScreenPage;
import 'cubit.dart';

class FirstRegisterPage extends StatelessWidget {
  const FirstRegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => FirstRegisterCubit(),
      child: Scaffold(
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
            children: [
              Image.asset(
                "assets/images/second_logo.png",
                width: 72.w,
                height: 82.h,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 20.h),
              Text(
                textAlign: TextAlign.end,
                "إنشاء حساب جديد",
                style: TextStyles.font20Weight700Black,
              ),
              SizedBox(height: 20.h),
              Image.asset("assets/images/Group 34273.png"),
              SizedBox(height: 20.h),
              CustomTextFormFeild(
                upperText: "الاسم الرباعي",
                radius: 8.sp,
                fillColor: AppColors.babyBlueColor,

                hint: "مثال: زايد محمد زايد محمد",
              ),
              SizedBox(height: 10.h),
              CustomTextFormFeild(
                radius: 8.sp,
                fillColor: AppColors.babyBlueColor,
                upperText: "البريد الإلكتروني",

                hint: "مثال: zmohamed@mail.com",
              ),
              SizedBox(height: 10.h),
              CustomTextFormFeild(
                radius: 8.sp,
                fillColor: AppColors.babyBlueColor,
                upperText: "كلمة المرور",

                hint: "**********",
                textDirection: TextDirection.ltr,
              ),
              CustomTextFormFeild(
                radius: 8.sp,
                fillColor: AppColors.babyBlueColor,
                upperText: "تأكيد كلمة المرور",

                hint: "**********",
                textDirection: TextDirection.ltr,
              ),
              SizedBox(height: 30.h),

              CustomButton(
                text: "التالي",
                onPressed: () {
                  MagicRouter.navigateTo(SecondRegisterScreenPage());
                },
              ),

              SizedBox(height: 24.h),
              RichText(
                textAlign: TextAlign.center, // or TextAlign.end
                text: TextSpan(
                  style: TextStyles.font16Weight400Black,
                  children: [
                    TextSpan(text: "لديك حساب بالفعل؟ "),
                    TextSpan(
                      text: "تسجيل الدخول",
                      style: TextStyles.font20Weight700BlueColor,
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          MagicRouter.navigateTo(LoginPage());
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
