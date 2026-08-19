
import 'package:dr_hakeem/core/theming/colors.dart';
import 'package:dr_hakeem/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final double? width;
  final double? height;
  final double? radius;
  final double? borderWidth;
  final TextStyle? textStyle;
  final Color? color;
  final Color? borderColor;

  const CustomButton({
    super.key,
    this.onPressed,
    required this.text,
    this.width,
    this.height,
    this.textStyle,
    this.color,
    this.radius,
    this.borderColor,
    this.borderWidth,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 345.w,
      height: height ?? 48.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? AppColors.blueColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: borderWidth ?? 0,
              color: borderColor ?? Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(radius ?? 8.sp),
          ),
        ),
        child: Text(text, style: textStyle ?? TextStyles.font20Weight700White),
      ),
    );
  }
}
