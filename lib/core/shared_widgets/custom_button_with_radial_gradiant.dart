import 'package:dr_hakeem/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theming/colors.dart' show AppColors;

class CustomButtonWithRadialGradiant extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final bool? hasImage;
  final double? height;
  final double? width;
  final TextStyle? texstStyle;
  final double? radius;
  final AlignmentGeometry? alignment;

  const CustomButtonWithRadialGradiant({
    super.key,
    this.onPressed,
    required this.text,
    this.hasImage,
    this.height,
    this.width,
    this.texstStyle,
    this.radius,
    this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 165.w,
      height: height ?? 37.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19.r),
        gradient: const RadialGradient(
          center: Alignment.center,
          radius: 2,
          colors: [Color(0xFF29ABE2), Color(0xFF00A99D)],
          stops: [0.0, 1.0],
        ),
      ),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 19.r),
          ),
        ),
        child: hasImage == true
            ? Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    text,
                    textAlign: TextAlign.center,
                    style:
                        texstStyle ??
                        TextStyles.font13Weight400white.copyWith(
                          color: AppColors.whiteColor,
                        ),
                  ),
                  SizedBox(width: 4.w),
                  Flexible(child: Icon(Icons.add, color: AppColors.whiteColor, size: 13.sp)),
                ],
              )
            : Center(
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style:
                      texstStyle ??
                      TextStyles.font13Weight400white.copyWith(
                        color: AppColors.whiteColor,
                      ),
                ),
              ),
      ),
    );
  }
}
