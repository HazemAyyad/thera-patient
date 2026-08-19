import 'package:dr_hakeem/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/theming/styles.dart' show TextStyles;

class ContainerOfMedicineDetails extends StatelessWidget {
  const ContainerOfMedicineDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.sp),
        color: AppColors.babyBlueColor,
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: 24.w,
          right: 16.w,
          top: 16.h,
          bottom: 16.h,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  "assets/svgs/tabler_edit.svg",
                  width: 28.w,
                  height: 28.w,
                  fit: BoxFit.contain,
                ),

                SizedBox(width: 16.w),
                SvgPicture.asset(
                  "assets/svgs/fluent_delete-12-regular.svg",
                  width: 28.w,
                  height: 28.w,
                  fit: BoxFit.contain,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("أسم الدواء", style: TextStyles.font14Weight700Black),
                SizedBox(height: 16.h),

                Text(
                  "دواء المفاصل",
                  style: TextStyles.font13Weight400LightenGrey,
                ),
                SizedBox(height: 16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "يوميا صباحا",
                      style: TextStyles.font13Weight400LightenGrey,
                    ),
                    SizedBox(width: 8.w),
                    Text("موعد الدواء", style: TextStyles.font13Weight700Black),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
