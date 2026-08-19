import 'package:dr_hakeem/core/shared_widgets/custom_no_color_with_icon_in_end.dart';
import 'package:dr_hakeem/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/styles.dart';

class ContainerOfDoctorDetails extends StatelessWidget {
  final bool? isFavorite;
  final String? imageUrl;
  final bool? hasImage;
  final String? name;
  final String? buttonText;
  void Function()? addFavorite;
  final String? phoneNumber;
   ContainerOfDoctorDetails({super.key, this.isFavorite = false,this.addFavorite, this.imageUrl, this.name, this.buttonText, this.hasImage, this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(name??"د. هشام حمايل", style: TextStyles.font19Weight700Blue),
            SizedBox(height: 24.h),
            CustomNoColorWithIconInEnd(
              width: 105.w,
              height: 38.h,
              text:buttonText?? "طب عام",
              hasImage:hasImage?? true,
              iconImage: "assets/svgs/Group 00 (2).svg",
            ),
            SizedBox(height: 24.h),
            Text(phoneNumber??"50 شيكل / ش", style: TextStyles.font13Weight400Blue),
          ],
        ),
        SizedBox(width: 16.w),
        Stack(alignment: Alignment.bottomRight,
          children: [
            Image.asset(
              imageUrl??    "assets/images/Group 55 (1).png",
              width: 164.w,
              height: 195.h,
            ),
            Positioned(bottom: 10.w,
              child: InkWell(onTap:addFavorite,
                child: Icon(
                  Icons.favorite,
                  size: 25.sp,
                  color: isFavorite!
                      ? AppColors.redColor
                      : AppColors.greyColor,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
