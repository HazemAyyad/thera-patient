import 'package:dr_hakeem/core/theming/colors.dart';
import 'package:dr_hakeem/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomNoColoredButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final bool? hasImage;
  final String? iconImage;
  final double? width;
  final double? height;

  const CustomNoColoredButton({
    super.key,
    this.onPressed,
    required this.text,
    this.hasImage,
    this.iconImage, this.width, this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width??345.w,
      height:height?? 48.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.sp),
        gradient: const LinearGradient(
          colors: [Color(0xFF29ABE2), Color(0xFF00A99D)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Container(
        margin: EdgeInsets.all(1.sp),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(8.sp),
        ),
        child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            backgroundColor: AppColors.whiteColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.sp),
            ),
          ),
          child: hasImage == true && iconImage != null
              ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: TextStyles.font20Weight700White.copyWith(
                  color: AppColors.blueColor,
                ),
              ),
              SizedBox(width: 5.w),
              SvgPicture.asset(iconImage!),
            ],
          )
              : Center(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyles.font20Weight700White.copyWith(
                color: AppColors.blueColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

