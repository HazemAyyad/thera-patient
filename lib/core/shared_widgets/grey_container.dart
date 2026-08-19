import 'package:dr_hakeem/core/theming/styles.dart' show TextStyles;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../theming/colors.dart';

class GreyContainer extends StatelessWidget {
  final String? text;
  final String? iconUrl;
  final String? number;
  final double? iconWidth;
  final double? iconHeight;
  final double? width;
  final double? height;


  const GreyContainer({
    super.key,
    this.text,
    this.iconUrl,
    this.number,
    this.iconWidth,
    this.iconHeight, this.width, this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width:width?? 104.w,
      height: height??60.h,
      decoration: BoxDecoration(
        color: AppColors.whiteGreyColor,
        borderRadius: BorderRadius.circular(8.sp),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text!, style: TextStyles.font15Weight700Black),

          SizedBox(height: 8.w),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(number!, style: TextStyles.font15Weight400Green),
              SizedBox(width: 4.w),
              SvgPicture.asset(
                iconUrl!,
                width: iconWidth,
                height: iconHeight,
                fit: BoxFit.contain,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
