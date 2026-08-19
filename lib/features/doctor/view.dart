import 'package:dr_hakeem/core/routing/page_router.dart';
import 'package:dr_hakeem/core/shared_widgets/custom_button_with_radial_gradiant.dart';
import 'package:dr_hakeem/core/shared_widgets/custom_no_color_with_icon_in_end.dart';
import 'package:dr_hakeem/core/shared_widgets/dropDownButton.dart';
import 'package:dr_hakeem/features/doctor_details/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/shared_widgets/custom_text_form_feild.dart'
    show CustomTextFormFeild;
import '../../core/theming/colors.dart' show AppColors;
import '../../core/theming/styles.dart' show TextStyles;
import '../bottom_navigation_bar/search/widgets/container_of_lab.dart';
import '../bottom_navigation_bar/search/widgets/name_and_image_of_doctor.dart';
import 'cubit.dart';
import 'state.dart';

class DoctorPage extends StatelessWidget {
  const DoctorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => DoctorCubit(),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<DoctorCubit, DoctorState>(
            builder: (context, state) {
              final cubit = BlocProvider.of<DoctorCubit>(context);

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
                            "قائمة الأطباء",
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
                  SizedBox(height: 21.h),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    reverse: true,
                    physics: const ClampingScrollPhysics(),

                    child: Row(
                      children: [
                        CustomNoColorWithIconInEnd(
                          text: "باطنة",
                          width: 105.w,
                          height: 38.h,
                        ),
                        SizedBox(width: 8.w),
                        CustomNoColorWithIconInEnd(
                          text: "أنف وحنجرة",
                          width: 105.w,
                          height: 38.h,
                          hasImage: true,
                        ),
                        SizedBox(width: 8.w),
                        CustomNoColorWithIconInEnd(
                          text: "طب اطفال",
                          width: 105.w,
                          height: 38.h,
                        ),
                        SizedBox(width: 8.w),
                        CustomNoColorWithIconInEnd(
                          text: "طب عيون",
                          iconImage: "assets/svgs/Group 00 (4).svg",
                          width: 105.w,
                          height: 38.h,
                          hasImage: true,
                        ),
                        SizedBox(width: 8.w),

                        SizedBox(width: 8.w),
                        CustomNoColorWithIconInEnd(
                          text: "طب أسنان",
                          hasImage: true,
                          width: 105.w,
                          height: 38.h,
                          iconImage: "assets/svgs/Group 00 (3).svg",
                        ),
                        SizedBox(width: 8.w),
                        CustomNoColorWithIconInEnd(
                          width: 105.w,
                          height: 38.h,
                          text: "طب عام",
                          hasImage: true,
                          iconImage: "assets/svgs/Group 00 (2).svg",
                        ),
                        SizedBox(width: 8.w),
                        CustomButtonWithRadialGradiant(
                          text: "الكل",
                          width: 105.w,
                          height: 38.h,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Text(
                        "عرض الكل",
                        style: TextStyles.font11Weight400LightenGrey,
                      ),
                      Text(
                        "أفضل الأطباء",
                        style: TextStyles.font15Weight700Black,
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    children: [
                      NameAndImageOfDoctor(
                        height: 191.h,
                        width: 173.w,
                        SizedBoxHeight: 9.h,
                        textName: "د. محمد علي",
                        textSpecialty: "طبيب عام",
                        imageUrl: "assets/images/Group 55.png",
                      ),
                      SizedBox(width: 8.w),
                      InkWell(
                        onTap: () {
                          MagicRouter.navigateTo(DoctorDetailsPage());
                        },
                        child: NameAndImageOfDoctor(),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Text(
                        "عرض الكل",
                        style: TextStyles.font11Weight400LightenGrey,
                      ),
                      Text(
                        "أفضل أطباء الأسنان",
                        style: TextStyles.font15Weight700Black,
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  SingleChildScrollView(
                    reverse: true,
                    physics: const ClampingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        NameAndImageOfDoctor(textSpecialty: "طبيب أسنان"),
                        SizedBox(width: 16.w),
                        NameAndImageOfDoctor(
                          height: 191.h,
                          width: 173.w,
                          SizedBoxHeight: 9.h,

                          textSpecialty: "طبيب أسنان",
                          imageUrl: "assets/images/Group 55.png",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Text(
                        "عرض الكل",
                        style: TextStyles.font11Weight400LightenGrey,
                      ),
                      Text(
                        "أفضل أطباء العيون",
                        style: TextStyles.font15Weight700Black,
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    children: [
                      NameAndImageOfDoctor(
                        height: 191.h,
                        width: 173.w,
                        SizedBoxHeight: 9.h,
                        textName: "د. محمد علي",
                        textSpecialty: "طبيب عيون",
                        imageUrl: "assets/images/Group 55.png",
                      ),
                      SizedBox(width: 8.w),
                      NameAndImageOfDoctor(textSpecialty: "طبيب عيون"),
                    ],
                  ),
                  SizedBox(height: 16.h),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Text(
                        "عرض الكل",
                        style: TextStyles.font11Weight400LightenGrey,
                      ),
                      Text(
                        "أفضل أطباء الأطفال",
                        style: TextStyles.font15Weight700Black,
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  SingleChildScrollView(
                    reverse: true,
                    physics: const ClampingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        NameAndImageOfDoctor(textSpecialty: "طبيب أطفال"),
                        SizedBox(width: 16.w),
                        NameAndImageOfDoctor(
                          height: 191.h,
                          width: 173.w,
                          SizedBoxHeight: 9.h,
                          textName: "د. محمد علي",
                          textSpecialty: "طبيب أطفال",
                          imageUrl: "assets/images/Group 55.png",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Text(
                        "عرض الكل",
                        style: TextStyles.font11Weight400LightenGrey,
                      ),
                      Text(
                        "أفضل أطباء الأنف والحنجرة",
                        style: TextStyles.font15Weight700Black,
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    children: [
                      NameAndImageOfDoctor(
                        height: 191.h,
                        width: 173.w,
                        SizedBoxHeight: 9.h,
                        textName: "د. محمد علي",
                        textSpecialty: "طبيب أنف وحنجرة",
                        imageUrl: "assets/images/Group 55.png",
                      ),
                      SizedBox(width: 8.w),
                      NameAndImageOfDoctor(textSpecialty: "طبيب أنف وحنجرةن"),
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
