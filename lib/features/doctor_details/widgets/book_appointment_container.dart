import 'package:dr_hakeem/core/shared_widgets/custom_button_with_radial_gradiant.dart';
import 'package:dr_hakeem/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theming/styles.dart';
import '../../calender/view.dart' show CalenderPage;

class BookAppointmentContainer extends StatelessWidget {
  final String? text;
  final String? cityText;

  const BookAppointmentContainer({super.key, this.text, this.cityText});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 345.w,
      height: 64.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.sp),
        color: AppColors.lightColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(width: 16.w),
          InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => CalenderPage(),
              ).then((selectedDate) {
                if (selectedDate != null) {
                  print("Selected: $selectedDate");
                }
              });
            },
            child: CustomButtonWithRadialGradiant(
              text: "حجز موعد",
              width: 92.w,
              height: 32.h,
              texstStyle: TextStyles.font14Weight700White,
              radius: 24.sp,
            ),
          ),
          // SizedBox(width: 100.w,),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 100.w, right: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(text ?? '', style: TextStyles.font16Weight700Black),
                  SizedBox(height: 8.h),
                  Text(
                    cityText ?? '',
                    style: TextStyles.font14Weight400KLightenGrey,
                  ),
                ],
              ),
            ),
          ),
          // SizedBox(width: 16.w,),
        ],
      ),
    );
  }
}
