import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';

class CustomButtonPayment extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final double? width;
  final double? height;
  final bool? isDelivered;
  final VoidCallback? onTap;

  const CustomButtonPayment({
    super.key,
    this.onPressed,
    required this.text,
    this.width,
    this.height,
    this.isDelivered,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 112.w,
        height: 40.h,
        decoration: BoxDecoration(
          color: isDelivered == true
              ? AppColors.lightGreenColor
              : AppColors.whiteColor,
          borderRadius: BorderRadius.circular(8.sp),
          border: Border.all(color:isDelivered==true?AppColors.lightGreenColor: AppColors.blueColor, width: 1.w),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "طلب توصيل",
              style: isDelivered == true
                  ? TextStyles.font13Weight400white
                  : TextStyles.font13Weight400Blue,
            ),
            SizedBox(width: 8.w),
            SvgPicture.asset(isDelivered == true?
              "assets/svgs/hugeicons_truck-delivery (1).svg"
              :"assets/svgs/hugeicons_truck-delivery.svg",
              width: 23.w,
              height: 23.w,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }
}
