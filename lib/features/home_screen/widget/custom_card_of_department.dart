import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/theming/styles.dart';

class CustomCardOfDepartment extends StatelessWidget {
  final String text;
  final String imageText;
  final bool isRed;
  void Function()? onTap;

   CustomCardOfDepartment({
    super.key,
    required this.text,
    required this.imageText,
    required this.isRed,
     this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: onTap,
      child: Stack(
        children: [
          Image.asset(
            isRed
                ? "assets/images/Subtract (4).png"
                : "assets/images/Subtract (3).png",
            width: 164.w,
            height: 75.h,
            fit: BoxFit.fill,
          ),
          Positioned(
            bottom: 35.h,
            right: 52.w,
            child: SvgPicture.asset(
                imageText, width: 55.w, height: 55.h),
          ),

          Positioned.fill(
            top: 20.h,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyles.font19Weight700White,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
