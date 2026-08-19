import 'package:birth_picker/birth_picker.dart';
import 'package:dr_hakeem/core/shared_widgets/custom_no_colored_button.dart';
import 'package:dr_hakeem/core/shared_widgets/dropDownButton.dart';
import 'package:dr_hakeem/features/register_pages/first_register_screen/view.dart';
import 'package:dr_hakeem/features/register_pages/second_register_screen/state.dart';
import 'package:dr_hakeem/features/register_pages/third_regster_screen/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/theming/styles.dart';
import '../../bottom_navigation_bar/view.dart';
import 'cubit.dart';
import 'package:dr_hakeem/core/routing/page_router.dart';
import 'package:dr_hakeem/core/shared_widgets/custom_button.dart';
import 'package:dr_hakeem/core/shared_widgets/custom_text_form_feild.dart';

import '../../../core/theming/colors.dart';

class SecondRegisterScreenPage extends StatelessWidget {
  const SecondRegisterScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SecondRegisterScreenCubit(),
      child: Scaffold(
        body: SafeArea(
          child:
              BlocBuilder<SecondRegisterScreenCubit, SecondRegisterScreenState>(
                builder: (context, state) {
                  final cubit = BlocProvider.of<SecondRegisterScreenCubit>(
                    context,
                  );

                  return ListView(
                    padding: EdgeInsets.symmetric(
                      vertical: 20.h,
                      horizontal: 20.w,
                    ),
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              MagicRouter.navigateTo(BottomNavigationBarPage());
                            },
                            child: Text(
                              "تخطي",
                              style: TextStyles.font16Weight400Green,
                            ),
                          ),
                          SizedBox(width: 70.w),
                          Image.asset(
                            "assets/images/second_logo.png",
                            fit: BoxFit.fill,
                            width: 140.w,
                            height: 82.h,
                          ),
                        ],
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: 10.h),
                        child: Text(
                          textAlign: TextAlign.end,
                          "إنشاء حساب جديد",
                          style: TextStyles.font20Weight700Black,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Image.asset("assets/images/Group 34273 (2).png"),
                      SizedBox(height: 20.h),
                      Text(
                        textAlign: TextAlign.end,
                        "تاريخ الميلاد",
                        style: TextStyles.font15Weight400FourthBlack,
                      ),
                      SizedBox(height: 5.h),
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
                            icon: SvgPicture.asset(
                              "assets/svgs/uil_calender.svg",
                            ),
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

                      SizedBox(height: 10.h),
                      Text(
                        textAlign: TextAlign.end,
                        "الجنس",
                        style: TextStyles.font15Weight400FourthBlack,
                      ),
                      SizedBox(height: 10.h),
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
                      SizedBox(height: 15.h),
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
                      Row(
                        children: [
                          Expanded(
                            child: CustomButton(
                              text: "التالي",
                              onPressed: () {
                                MagicRouter.navigateTo(
                                  ThirdRegsterScreenPage(),
                                );
                              },
                            ),
                          ),
                          SizedBox(width: 20.w),
                          Expanded(
                            child: CustomNoColoredButton(
                              text: "رجوع",
                              onPressed: () {
                                MagicRouter.navigateTo(FirstRegisterPage());
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
        ),
      ),
    );
  }
}
