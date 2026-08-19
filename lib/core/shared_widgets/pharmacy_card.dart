import 'package:dr_hakeem/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../theming/styles.dart';

class PharmacyAndLabCard extends StatelessWidget {
  final double? width;
  final double? height;
  final double? imageWidth;
  final double? imageHeight;
  final double? widthOfSpace;
  final String? pharmacyName;
  final String? imageUrl;
  final VoidCallback? onTap;

  const PharmacyAndLabCard({
    super.key,
    this.width,
    this.height,
    this.imageWidth,
    this.imageHeight,
    this.pharmacyName,
    this.imageUrl, this.onTap, this.widthOfSpace,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap,
      child: Container(
        width: width ?? 173.w,

        height: height ?? 40.h,
        decoration: BoxDecoration(
          color: AppColors.babyBlueColor,
          borderRadius: BorderRadius.circular(10.r),
        ),
        padding: EdgeInsets.all(8.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50.r),
                      child: SvgPicture.asset(
                        "assets/svgs/Ellipse 14.svg",
                        width: 6.w,
                        height: 6.w,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      pharmacyName ?? "صيدلية بهاء",
                      style: TextStyles.font13Weight700Blue,
                    ),
                  ],
                ),
                SizedBox(height: 5.h),
                Text(
                  "بيتا - نابلس",
                  style: TextStyles.font10Weight400LightenGrey,
                ),
                SizedBox(height: 5.h),
                Text(
                  "+970 599XXXXXX",
                  style: TextStyles.font10Weight400LightenGrey,
                ),
              ],
            ),
            SizedBox(width:widthOfSpace?? 10.w),
            Image.asset(
              imageUrl ?? "assets/images/Rectangle 19.png",
              width: imageWidth ?? 61.w,
              height: imageHeight ?? 61.h,
              fit: BoxFit.fill,
            ),
          ],
        ),
      ),
    );
  }
}
