import 'package:birth_picker/birth_picker.dart';
import 'package:dr_hakeem/core/shared_widgets/dropDownButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/routing/page_router.dart' show MagicRouter;
import '../../../../../core/shared_widgets/custom_button.dart';
import '../../../../../core/shared_widgets/custom_text_form_feild.dart'
    show CustomTextFormFeild;
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart' show TextStyles;
import 'cubit.dart';
import 'state.dart';

class SocialInformationPage extends StatelessWidget {
  const SocialInformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SocialInformationCubit(),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<SocialInformationCubit, SocialInformationState>(
            builder: (context, state) {
              final cubit = BlocProvider.of<SocialInformationCubit>(context);
              return ListView(
                padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "المعلومات الأجتماعية",
                        style: TextStyles.font19Weight700Black,
                      ),
                      SizedBox(width: 8.w),
                      InkWell(
                        onTap: () {
                          MagicRouter.pop();
                        },
                        child: SvgPicture.asset(
                          "assets/svgs/weui_arrow-filled (1).svg",
                          width: 13.5.w,
                          fit: BoxFit.contain,
                          height: 27.h,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 32.h),
                  Text(
                    textAlign: TextAlign.end,
                    "تاريخ الميلاد",
                    style: TextStyles.font15Weight400FourthBlack,
                  ),
                  SizedBox(height: 8.h),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.babyBlueColor,
                        border: Border.all(color: AppColors.babyBlueColor),
                      ),
                      child: BirthPicker(
                        textStyle: TextStyles.font15Weight400LightenGrey,
                        initialDate: DateTime(2000, 1, 1),
                        icon: SvgPicture.asset("assets/svgs/uil_calender.svg"),
                        onChanged: (dateTime) {
                          if (dateTime != null) {
                            print(
                              'Selected Date: ${dateTime.toIso8601String()}',
                            );
                          } else {
                            print('Invalid Date');
                          }
                        },
                      ),
                    ),
                  ),

                  SizedBox(height: 16.h),
                  Text(
                    textAlign: TextAlign.end,
                    "الجنس",
                    style: TextStyles.font15Weight400FourthBlack,
                  ),
                  SizedBox(height: 8.h),
                  DropdownButtonWidget(
                    selectedGender: cubit.selectedGender,
                    onChanged: cubit.onChanged,
                    hint: "أنثي",
                    items: <String>["أنثي", "ذكر"].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "البلدة/المنطقة",
                        style: TextStyles.font15Weight400FourthBlack,
                      ),
                      SizedBox(width: 120.w),
                      Text(
                        "المحافظة",
                        style: TextStyles.font15Weight400FourthBlack,
                      ),
                    ],
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextFormFeild(
                          radius: 8.sp,
                          fillColor: AppColors.babyBlueColor,

                          hint: "مثال: نابلس",
                        ),
                      ),
                      SizedBox(width: 16.w),
                      Expanded(
                        child: DropdownButtonWidget(
                          width: 165.w,
                          height: 48.h,
                          selectedGender: cubit.selectedGenderGovernorate,
                          onChanged: cubit.onChangedGovernorate,
                          hint: "نابلس",
                          items: <String>["نابلس", "غزة", "رفح"].map((
                            String value,
                          ) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),

                  CustomTextFormFeild(
                    upperText: "العنوان",
                    radius: 8.sp,
                    fillColor: AppColors.babyBlueColor,
                    starText: "",

                    hint: "مثال: نابلس..",
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    textAlign: TextAlign.end,
                    "الحالة الاجتماعية",
                    style: TextStyles.font15Weight400FourthBlack,
                  ),
                  SizedBox(height: 5.h),
                  DropdownButtonWidget(
                    // dropdownColor: AppColors.babyBlueColor,
                    onChanged: cubit.onChangedSocialState,
                    hint: "أعزب",
                    selectedGender: cubit.selectedGenderSocialState,

                    items: <String>["أعزب", "متزوج", "أرمل"].map((
                      String value,
                    ) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  CustomTextFormFeild(
                    starText: "",
                    upperText: "رقم هاتف محمول",
                    radius: 8.sp,
                    fillColor: AppColors.babyBlueColor,

                    hint: "مثال: 12457895102 966+",
                  ),
                  CustomTextFormFeild(
                    starText: "",
                    upperText: "رقم هاتف بديل",
                    radius: 8.sp,
                    fillColor: AppColors.babyBlueColor,

                    hint: "مثال: 1236547890 966+",
                  ),
                  SizedBox(height: 20.h),
                  CustomButton(text: "حفظ التعديلات", onPressed: () {}),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
