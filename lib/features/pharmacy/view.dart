import 'package:dr_hakeem/features/pharmacy_details/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart' show SvgPicture;

import '../../core/routing/page_router.dart';
import '../../core/shared_widgets/custom_text_form_feild.dart'
    show CustomTextFormFeild;
import '../../core/shared_widgets/dropDownButton.dart';
import '../../core/theming/colors.dart';
import '../../core/theming/styles.dart';
import '../../core/shared_widgets/pharmacy_card.dart';
import 'cubit.dart';
import 'state.dart';

class PharmacyPage extends StatelessWidget {
  const PharmacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => PharmacyCubit(),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<PharmacyCubit, PharmacyState>(
            builder: (context, state) {
              final cubit = BlocProvider.of<PharmacyCubit>(context);
              return ListView(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 108.w,
                            height: 32.h,
                            child: DropdownButtonWidget(
                           //   dropdownColor: AppColors.babyBlueColor,
                              radius: 24.sp,
                              hint: "القدس",
                              items: <String>["القدس", "نابلس", "غزة", "رفح"]
                                  .map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  })
                                  .toList(),
                              onChanged: cubit.onChanged,
                              selectedGender: cubit.selectedGender,
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            "المدينة",
                            style: TextStyles.font13Weight400LightenGrey,
                          ),
                        ],
                      ),
                      SizedBox(width: 24.w),
                      Row(
                        children: [
                          Text(
                            "قائمة الصيدليات",
                            style: TextStyles.font20Weight700Black,
                          ),
                          const SizedBox(width: 8),
                          InkWell(
                            onTap: () {
                              MagicRouter.pop();
                            },
                            child: SvgPicture.asset(
                              "assets/svgs/weui_arrow-filled (1).svg",
                              width: 13.5.w,
                              height: 27.h,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  CustomTextFormFeild(
                    // height: 48.h,
                    // width: 345.w,
                    hint: "أبحث عن الصيدلية المناسبة لك",
                    fillColor: AppColors.whiteColor,
                    suffixIcon: Padding(
                      padding: EdgeInsets.all(8.0.sp),
                      child: SvgPicture.asset("assets/svgs/Group 34955.svg"),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(8.0.sp),
                      child: SvgPicture.asset(
                        "assets/svgs/maki_doctor.svg",
                        width: 24,
                        height: 24,
                      ),
                    ),
                  ),
                  SizedBox(height: 24.h),
                  PharmacyAndLabCard(
                    pharmacyName: "صيدلية مرفق",
                    onTap: () {
                      MagicRouter.navigateTo(PharmacyDetailsPage());
                    },
                    width: 345.w,
                    height: 77.h,
                    imageHeight: 69.w,
                    imageWidth: 69.w,
                  ),
                  SizedBox(height: 16.h),
                  PharmacyAndLabCard(
                    width: 345.w,
                    pharmacyName: "صيدلية بهاء",
                    height: 77.h,
                    imageHeight: 69.w,
                    imageWidth: 69.w,
                    imageUrl: "assets/images/Rectangle 19 (1).png",
                  ),
                  SizedBox(height: 16.h),
                  PharmacyAndLabCard(
                    width: 345.w,
                    pharmacyName: "صيدلية جواد",
                    height: 77.h,
                    imageHeight: 69.w,
                    imageWidth: 69.w,
                    imageUrl: "assets/images/Rectangle 19 (2).png",
                  ),
                  SizedBox(height: 16.h),
                  PharmacyAndLabCard(
                    width: 345.w,
                    pharmacyName: "صيدلية الحكمة",
                    height: 77.h,
                    imageHeight: 69.w,
                    imageWidth: 69.w,
                    imageUrl: "assets/images/Rectangle 19 (3).png",
                  ),
                  SizedBox(height: 16.h),
                  PharmacyAndLabCard(
                    width: 345.w,
                    pharmacyName: "صيدلية فلسطين",
                    height: 77.h,
                    imageHeight: 69.w,
                    imageWidth: 69.w,
                    imageUrl: "assets/images/Rectangle 19 (4).png",
                  ),
                  SizedBox(height: 16.h),
                  PharmacyAndLabCard(
                    width: 345.w,
                    pharmacyName: "صيدلية الحنبلي",
                    height: 77.h,
                    imageHeight: 69.w,
                    imageWidth: 69.w,
                    imageUrl: "assets/images/Rectangle 19 (6).png",
                  ),
                  SizedBox(height: 16.h),
                  PharmacyAndLabCard(
                    width: 345.w,
                    pharmacyName: "صيدلية امجد",
                    height: 77.h,
                    imageHeight: 69.w,
                    imageWidth: 69.w,
                    imageUrl: "assets/images/Rectangle 19 (7).png",
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
