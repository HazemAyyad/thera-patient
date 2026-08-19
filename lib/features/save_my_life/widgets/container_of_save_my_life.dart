import 'package:dr_hakeem/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theming/styles.dart';

class ContainerOfSaveMyLife extends StatelessWidget {
  final double? width;
  final double? height;
  final String? firstText;
  final String? secondText;
  final String? thirdText;
  final bool? hasThird;

  const ContainerOfSaveMyLife({
    super.key,
    this.width,
    this.height,
    this.firstText,
    this.secondText,
    this.thirdText, this.hasThird,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.sp),
        color: AppColors.babyBlueColor,
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(firstText!, style: TextStyles.font14Weight700Black),
            SizedBox(height: 16.h),
            Text(
              textDirection: TextDirection.rtl,
             secondText!,
              style: TextStyles.font13Weight700Red,
            ),
            SizedBox(height: 16.h),
          hasThird==true?  Text(
              textDirection: TextDirection.rtl,
              thirdText!,
              style: TextStyles.font13Weight400Red,
            ):
              SizedBox.shrink()

          ],
        ),
      ),
    );
  }
}
