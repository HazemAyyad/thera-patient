import 'package:dr_hakeem/core/routing/page_router.dart';
import 'package:dr_hakeem/core/shared_widgets/custom_button.dart';
import 'package:dr_hakeem/core/theming/colors.dart';
import 'package:dr_hakeem/features/login/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/styles.dart';

class LogOut extends StatelessWidget {
  const LogOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Dialog(backgroundColor: AppColors.whiteColor,
        insetPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.sp),
        ),
        child: SizedBox(
          width: 345.w,
          height: 122.h,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "هل انت متاكد انك تريد تسجيل الخروج؟",
                  style: TextStyles.font16Weight700Red,
                ),
                SizedBox(height: 24.h),
                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        borderColor: AppColors.redColor,
                        borderWidth: 1.w,
                        onPressed: (){MagicRouter.pop();},
                        width: 140.w,
                        radius: 20.sp,
                        height: 32.h,
                        text: "الغاء",
                        color: AppColors.whiteColor,
                        textStyle: TextStyles.font16Weight400Red,
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: CustomButton(
                        onPressed: (){
                          MagicRouter.navigateTo(LoginPage());
                        },
                        width: 140.w,
                        radius: 20.sp,
                        height: 32.h,
                        text: "نعم",
                        color: AppColors.redColor,
                        textStyle: TextStyles.font16Weight400White,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
