import 'package:dr_hakeem/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theming/colors.dart';

class TypeOfSettings extends StatelessWidget {
  final String? settingName;
  final String? imageUrl;
  final double? iconWidth;
  final double? iconHeight;
  final bool? isRed;
  final VoidCallback? onTap;

  const TypeOfSettings({
    super.key,
    this.settingName,
    this.imageUrl,
    this.iconWidth,
    this.iconHeight,
    this.isRed, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 345.w,
        height: 54.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.sp),

          border: isRed!
              ? Border.all(color: AppColors.redColor, width: 1.w)
              : null,
          gradient: isRed!
              ? null
              : const RadialGradient(
                  colors: [Color(0xFF29ABE2), Color(0xFF00A99D)],
                  radius: 1.5,
                  center: Alignment.center,
                ),
        ),
        child: Container(
          margin: EdgeInsets.all(isRed! ? 0.sp : 1.sp),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(8.r),
          ),

          child: Padding(
            padding: EdgeInsets.all(14.sp),
            child: Row(
              children: [
                SvgPicture.asset(
                  isRed!
                      ? "assets/svgs/weui_arrow-filled (4).svg"
                      : "assets/svgs/weui_arrow-filled (3).svg",
                  width: 12.w,
                  height: 24.h,
                  fit: BoxFit.contain,
                ),

                Expanded(
                  child: Text(
                    textDirection: TextDirection.rtl,
                    settingName!,
                    style: isRed!
                        ? TextStyles.font16Weight400Red
                        : TextStyles.font16Weight400Black,
                  ),
                ),
                SizedBox(width: 15.w),
                SvgPicture.asset(
                  imageUrl ?? "assets/svgs/hugeicons_user-settings-01.svg",
                  width: iconWidth,
                  height: iconHeight,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
