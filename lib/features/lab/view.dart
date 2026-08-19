import 'package:dr_hakeem/features/lab_details/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/routing/page_router.dart' show MagicRouter;
import '../../core/shared_widgets/custom_text_form_feild.dart';
import '../../core/shared_widgets/dropDownButton.dart';
import '../../core/shared_widgets/pharmacy_card.dart' show PharmacyAndLabCard;
import '../../core/theming/colors.dart';
import '../../core/theming/styles.dart';
import '../bottom_navigation_bar/search/widgets/container_of_lab.dart';
import 'cubit.dart';
import 'state.dart';

class LabPage extends StatelessWidget {
  const LabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LabCubit(),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<LabCubit, LabState>(
            builder: (context, state) {
              final cubit = BlocProvider.of<LabCubit>(context);
              return ListView(
                padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),

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
                          SizedBox(width: 8.w),
                          Text(
                            "المدينة",
                            style: TextStyles.font13Weight400LightenGrey,
                          ),
                        ],
                      ),
                      SizedBox(width: 15.w),
                      Row(
                        children: [
                          Text(
                            "قائمة المختبرات الطبية",
                            style: TextStyles.font18Weight700Black,
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
                  SizedBox(height: 16.h),
                  CustomTextFormFeild(
                    // height: 48.h,
                    // width: 345.w,
                    hint: "أبحث عن المختبر المناسب لك",
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
                  Text(
                    textAlign: TextAlign.end,
                    "أفضل المختبرات",
                    style: TextStyles.font15Weight700Black,
                  ),
                  SizedBox(height: 24.h),
                  SingleChildScrollView(
                    reverse: true,
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ContainerOfLab(
                          imageText: "assets/images/Ellipse 16.png",
                          text: "كير لاب",
                        ),
                        SizedBox(width: 15.w),
                        ContainerOfLab(
                          imageText: "assets/images/Ellipse 15.png",
                          text: "مختبر النجاح الطبي",
                        ),
                        SizedBox(width: 15.w),
                        ContainerOfLab(
                          imageText: "assets/images/Ellipse 16.png",
                          text: "مختبر بيتا الطبي",
                        ),
                        SizedBox(width: 15.w),
                        ContainerOfLab(
                          imageText: "assets/images/Ellipse 15.png",
                          text: "دكتور لاب",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Text(
                    textAlign: TextAlign.end,
                    "قائمة المختبرات",
                    style: TextStyles.font15Weight700Black,
                  ),
                  SizedBox(height: 24.h),
                  PharmacyAndLabCard(
                    width: 345.w,
                    onTap: () {
                      MagicRouter.navigateTo(LabDetailsPage());
                    },
                    pharmacyName: "دكتور لاب",
                    widthOfSpace: 16.w,
                    height: 77.h,
                    imageHeight: 69.w,
                    imageWidth: 69.w,
                    imageUrl: "assets/images/Rectangle 19 (8).png",
                  ),
                  SizedBox(height: 16.h),
                  PharmacyAndLabCard(
                    width: 345.w,
                    pharmacyName: "مختبر النجاح الطبي",
                    widthOfSpace: 16.w,
                    height: 77.h,
                    imageHeight: 69.w,
                    imageWidth: 69.w,
                    imageUrl: "assets/images/Rectangle 19 (9).png",
                  ),
                  SizedBox(height: 16.h),
                  PharmacyAndLabCard(
                    width: 345.w,
                    pharmacyName: "المختبر",
                    widthOfSpace: 16.w,
                    height: 77.h,
                    imageHeight: 69.w,
                    imageWidth: 69.w,
                    imageUrl: "assets/images/Rectangle 19 (10).png",
                  ),
                  SizedBox(height: 16.h),
                  PharmacyAndLabCard(
                    width: 345.w,
                    pharmacyName: "مختبر بيتا الطبي",
                    widthOfSpace: 16.w,
                    height: 77.h,
                    imageHeight: 69.w,
                    imageWidth: 69.w,
                    imageUrl: "assets/images/Rectangle 19 (12).png",
                  ),
                  SizedBox(height: 16.h),
                  PharmacyAndLabCard(
                    width: 345.w,
                    pharmacyName: "كير لاب",
                    widthOfSpace: 16.w,
                    height: 77.h,
                    imageHeight: 69.w,
                    imageWidth: 69.w,
                    imageUrl: "assets/images/Rectangle 19 (13).png",
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
