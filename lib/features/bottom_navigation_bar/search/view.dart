import 'package:dr_hakeem/core/routing/page_router.dart';
import 'package:dr_hakeem/core/shared_widgets/custom_text_form_feild.dart';
import 'package:dr_hakeem/features/bottom_navigation_bar/search/widgets/container_of_lab.dart';
import 'package:dr_hakeem/features/bottom_navigation_bar/search/widgets/name_and_image_of_doctor.dart';
import 'package:dr_hakeem/core/shared_widgets/pharmacy_card.dart';
import 'package:dr_hakeem/features/doctor/view.dart';
import 'package:dr_hakeem/features/lab/view.dart';
import 'package:dr_hakeem/features/pharmacy/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/shared_widgets/custom_button_with_radial_gradiant.dart';
import '../../../core/shared_widgets/custom_no_color_with_icon_in_end.dart';
import '../../../core/shared_widgets/dropDownButton.dart';
import '../../../core/theming/colors.dart' show AppColors;
import '../../../core/theming/styles.dart';
import 'cubit.dart';
import 'state.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SearchCubit(),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<SearchCubit, SearchState>(
            builder: (context, state) {
              final cubit = BlocProvider.of<SearchCubit>(context);
              return ListView(
                padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 108.w,
                        height: 32.h,
                        child: DropdownButtonWidget(
                          //   dropdownColor: AppColors.babyBlueColor,
                          radius: 24.sp,
                          hint: "القدس",
                          items: <String>["القدس", "نابلس", "غزة", "رفح"].map((
                            String value,
                          ) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: cubit.onChanged,
                          selectedGender: cubit.selectedGender,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        "تبحث في",
                        style: TextStyles.font13Weight400LightenGrey,
                      ),
                    ],
                  ),
                  SizedBox(height: 15.h),
                  CustomTextFormFeild(
                    // width: 345.w,
                    // height:48.h ,
                    hint: "أبحث عن الخدمة المناسبة لك",
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
                  SizedBox(height: 20.h),
                  Row(
                    children: [
                      CustomNoColorWithIconInEnd(
                        text: "طبيب",
                        onPressed: () {},
                        hasImage: true,

                        iconImage: "assets/svgs/Group 00.svg",
                      ),
                      SizedBox(width: 20.w),
                      CustomButtonWithRadialGradiant(
                        text: "الكل",
                        onPressed: () {},
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    children: [
                      CustomNoColorWithIconInEnd(
                        text: "مختبر طبي",
                        onPressed: () {},
                        hasImage: true,
                        iconImage: "assets/svgs/Group 34957.svg",
                      ),
                      SizedBox(width: 20),
                      CustomNoColorWithIconInEnd(
                        text: "صيدلية",
                        onPressed: () {},
                        hasImage: true,
                        iconImage: "assets/svgs/Group 34957 (1).svg",
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      InkWell(
                        onTap: () {
                          MagicRouter.navigateTo(DoctorPage());
                        },
                        child: Text(
                          "عرض الكل",
                          style: TextStyles.font11Weight400LightenGrey,
                        ),
                      ),
                      Text(
                        "أفضل الأطباء",
                        style: TextStyles.font15Weight700Black,
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    children: [
                      NameAndImageOfDoctor(),
                      SizedBox(width: 20.w),
                      NameAndImageOfDoctor(),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      InkWell(
                        onTap: () {
                          MagicRouter.navigateTo(PharmacyPage());
                        },
                        child: Text(
                          "عرض الكل",
                          style: TextStyles.font11Weight400LightenGrey,
                        ),
                      ),
                      Text(
                        "أفضل الصيدليات",
                        style: TextStyles.font15Weight700Black,
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  SizedBox(
                    height: 80.h,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      reverse: true,
                      itemBuilder: (context, index) =>
                          const PharmacyAndLabCard(),
                      separatorBuilder: (context, index) =>
                          SizedBox(width: 12.h),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      InkWell(
                        onTap: () {
                          MagicRouter.navigateTo(LabPage());
                        },
                        child: Text(
                          "عرض الكل",
                          style: TextStyles.font11Weight400LightenGrey,
                        ),
                      ),
                      Text(
                        "أفضل المختبرات",
                        style: TextStyles.font15Weight700Black,
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
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
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
