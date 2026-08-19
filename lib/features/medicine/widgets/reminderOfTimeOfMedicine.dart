import 'package:dr_hakeem/core/shared_widgets/custom_button.dart';
import 'package:dr_hakeem/core/shared_widgets/custom_text_form_feild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theming/colors.dart';
import '../../../core/theming/styles.dart';

class ReminderOfTimeOfMedicine extends StatelessWidget {
  final void Function(String?) onChanged;
  final String? selectedPeriod;

  const ReminderOfTimeOfMedicine({
    super.key,
    required this.onChanged,
    this.selectedPeriod,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24.sp),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text("إسم الدواء", style: TextStyles.font15Weight400FourthBlack),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  width: 130.w,
                  height: 48.h,
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.sp),
                    gradient: const LinearGradient(
                      colors: [Color(0xFF29ABE2), Color(0xFF00A99D)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        dropdownColor: AppColors.blueColor,
                        iconEnabledColor: Colors.white,
                        icon: Image.asset(
                          "assets/images/weui_arrow-filled.png",
                        ),
                        value: selectedPeriod,
                        hint: Text(
                          "التكرار",
                          style: TextStyles.font18Weight400White,
                        ),
                        isExpanded: true,

                        onChanged: onChanged,
                        items:
                            <String>[
                              'قبل الأكل',
                              'بعد الأكل',
                              'صباحًا',
                              'مساءً',
                            ].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: TextStyles.font18Weight400White,
                                ),
                              );
                            }).toList(),
                      ),
                    ),
                  ),
                ),
              ),

              // Medicine name input
              SizedBox(width: 10.w),
              Expanded(
                child: CustomTextFormFeild(
                  fillColor: AppColors.babyBlueColor,

                  hint: "مثال: دواء..",
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          CustomTextFormFeild(
            upperText: "ملاحظة",
            starText: "",
            fillColor: AppColors.babyBlueColor,
            hint: "ملاحظات",
            maxLines: 4,
          ),
          SizedBox(height: 16.h),
          CustomButton(
            color: AppColors.lightGreenColor,
            text: "حفظ",
            onPressed: () {},
          ),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }
}
