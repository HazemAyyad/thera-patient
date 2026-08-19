import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/shared_widgets/custom_button_with_radial_gradiant.dart';
import '../../../core/theming/colors.dart';
import '../../../core/theming/styles.dart';

class ChooseSuitableDate extends StatelessWidget {
  const ChooseSuitableDate({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.sp)),
      insetPadding: EdgeInsets.all(24.sp),
      child: SizedBox(

        width: 345.w,
        height: 337.h,
        child: Padding(
          padding: EdgeInsets.all(24.sp),
          child: Column(
            children: [
              Text(
                textAlign: TextAlign.center,

                "أختر الوقت المناسب",
                style: TextStyles.font17Weight700Black,
              ),
              SizedBox(height: 24.h),
              Column(
                children: [
                  Container(
                    width: 297.w,
                    height: 50.h,
                    decoration: BoxDecoration(

                      borderRadius: BorderRadius.circular(8.sp),
                      color: AppColors.babyBlueColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: 9.w),
                        CustomButtonWithRadialGradiant(
                          text: "حجز",
                          width: 54.w,
                          height: 32.h,
                          texstStyle: TextStyles.font14Weight400White,
                          radius: 24.sp,
                        ),

                        SizedBox(width: 30.w),

                        Text(
                          "صباحا" ?? '',
                          style: TextStyles.font12Weight400FourthBlack,
                        ),
                        SizedBox(width: 30.w),
                        Text(
                          "10:30 - 11:30" ?? '',
                          style: TextStyles.font12Weight400FourthBlack,
                        ),
                        SizedBox(width: 30.w),
                        Text(
                          "الخميس\n 15/12" ?? '',
                          style: TextStyles.font14Weight700Black,
                        ),
                        SizedBox(width: 9.w),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h,),
                  Container(
                    width: 297.w,
                    height: 50.h,
                    decoration: BoxDecoration(

                      borderRadius: BorderRadius.circular(8.sp),
                      color: AppColors.babyBlueColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: 9.w),
                        CustomButtonWithRadialGradiant(
                          text: "حجز",
                          width: 54.w,
                          height: 32.h,
                          texstStyle: TextStyles.font14Weight400White,
                          radius: 24.sp,
                        ),

                        SizedBox(width: 30.w),

                        Text(
                          "صباحا" ?? '',
                          style: TextStyles.font12Weight400FourthBlack,
                        ),
                        SizedBox(width: 30.w),
                        Text(
                          "10:30 - 11:30" ?? '',
                          style: TextStyles.font12Weight400FourthBlack,
                        ),
                        SizedBox(width: 30.w),
                        Text(
                          "الخميس\n 15/12" ?? '',
                          style: TextStyles.font14Weight700Black,
                        ),
                        SizedBox(width: 9.w),
                      ],
                    ),

                  ),
                  SizedBox(height: 16.h,),
                  Container(
                    width: 297.w,
                    height: 50.h,
                    decoration: BoxDecoration(

                      borderRadius: BorderRadius.circular(8.sp),
                      color: AppColors.babyBlueColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: 9.w),
                        CustomButtonWithRadialGradiant(
                          text: "حجز",
                          width: 54.w,
                          height: 32.h,
                          texstStyle: TextStyles.font14Weight400White,
                          radius: 24.sp,
                        ),

                        SizedBox(width: 30.w),

                        Text(
                          "صباحا" ?? '',
                          style: TextStyles.font12Weight400FourthBlack,
                        ),
                        SizedBox(width: 30.w),
                        Text(
                          "10:30 - 11:30" ?? '',
                          style: TextStyles.font12Weight400FourthBlack,
                        ),
                        SizedBox(width: 30.w),
                        Text(
                          "الخميس\n 15/12" ?? '',
                          style: TextStyles.font14Weight700Black,
                        ),
                        SizedBox(width: 9.w),
                      ],
                    ),
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
