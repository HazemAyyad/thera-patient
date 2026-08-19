import 'package:dr_hakeem/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/theming/styles.dart' show TextStyles;

class Prescription extends StatelessWidget {
  final VoidCallback? onTap;
  const Prescription({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.babyBlueColor,
        borderRadius: BorderRadius.circular(10.sp),
      ),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("8/8/2025", style: TextStyles.font12Weight400Green),
                    Text(
                      "د. هشام حمايل",
                      style: TextStyles.font14Weight700OriginBlack,
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                Text("طب عام", style: TextStyles.font12Weight400LightenGrey),
                SizedBox(height: 16.h),
                Text(
                  "وصف الادوية",
                  style: TextStyles.font13Weight700LightenGrey,
                ),
                Text(
                  "-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------",
                  style: TextStyle(color: AppColors.otherGrey),
                ),
              ],
            ),
          ),

          Positioned(
            bottom: 23.h,
            left: 16.w,
            child: InkWell(onTap: onTap,
              child: SvgPicture.asset(
                "assets/svgs/Group 34984.svg",
                width: 24.w,
                height: 24.w,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
