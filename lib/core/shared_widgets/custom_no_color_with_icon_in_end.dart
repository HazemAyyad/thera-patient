import 'package:dr_hakeem/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../theming/colors.dart' show AppColors;

class CustomNoColorWithIconInEnd extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final bool hasImage;
  final String? iconImage;
  final double? height;
  final double? width;

  const CustomNoColorWithIconInEnd({
    super.key,
    this.onPressed,
    required this.text,
    this.hasImage = false,
    this.iconImage, this.height, this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width?? 165.w,
      height: height??38.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        gradient: const LinearGradient(
          colors: [Color(0xFF29ABE2), Color(0xFF00A99D)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Container(
        margin: EdgeInsets.all(1.5.sp),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(19.r),
        ),
        child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric( vertical: 8.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.r),
            ),
            backgroundColor: AppColors.whiteColor,
          ),
          child: hasImage && iconImage != null
              ? Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(textAlign: TextAlign.center,
                text,
                overflow: TextOverflow.ellipsis,
                style: TextStyles.font13Weight400Blue.copyWith(
                  color: AppColors.blueColor,
                ),
              ),
              SizedBox(width: 3.w),
              SvgPicture.asset(
                iconImage!,
                width: 25.w,
                height: 25.w,

                fit: BoxFit.contain,
                alignment: Alignment.center,
                clipBehavior: Clip.hardEdge,
              ),
            ],
          )
              : Center(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyles.font13Weight400Blue.copyWith(
                color: AppColors.blueColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
