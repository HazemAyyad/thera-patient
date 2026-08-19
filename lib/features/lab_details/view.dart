import 'package:dr_hakeem/core/shared_widgets/grey_container.dart';
import 'package:dr_hakeem/features/lab_details/widgets/choose_the_required_medical_examination.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/routing/page_router.dart' show MagicRouter;
import '../../core/shared_widgets/container_of_doctor_details.dart';
import '../../core/theming/colors.dart';
import '../../core/theming/styles.dart';
import 'cubit.dart';
import 'state.dart';

class LabDetailsPage extends StatelessWidget {
  const LabDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LabDetailsCubit(),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<LabDetailsCubit, LabDetailsState>(
            builder: (context, state) {
              final cubit = BlocProvider.of<LabDetailsCubit>(context);
              return ListView(
                padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(
                        "assets/svgs/share.svg",
                        width: 38.w,
                        height: 38.w,
                        fit: BoxFit.contain,
                      ),

                      SizedBox(width: 145.w),
                      Row(
                        children: [
                          Text(
                            "تفاصيل المختبر",
                            style: TextStyles.font20Weight700Black,
                          ),

                          SizedBox(width: 7.55.w),
                          InkWell(
                            onTap: () {
                              MagicRouter.pop();
                            },
                            child: SvgPicture.asset(
                              "assets/svgs/weui_arrow-filled (1).svg",
                              width: 13.445783310625757.w,
                              height: 26.891566621251513.h,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 26.h),
                  ContainerOfDoctorDetails(
                    isFavorite: cubit.isFavorite,
                    addFavorite: cubit.addFavorite,
                    hasImage: false,
                    phoneNumber: "+970 599XXXXXX",
                    buttonText: "بيتا - نابلس",
                    name: "دكتور لاب",
                    imageUrl: "assets/images/Rectangle 21 (1).png",
                  ),
                  SizedBox(height: 32.h),
                  Row(
                    children: [
                      GreyContainer(
                        width: 165.w,
                        height: 60.h,
                        text: "التقييم",
                        iconUrl: "assets/svgs/flat-color-icons_like.svg",
                        iconHeight: 17.w,
                        iconWidth: 17.w,
                        number: "4.6K",
                      ),
                      SizedBox(width: 15.w),

                      GreyContainer(
                        width: 165.w,
                        height: 60.h,
                        text: "عدد الزوار",
                        number: "2458",
                        iconUrl: "assets/svgs/gridicons_user (1).svg",
                        iconWidth: 18.w,
                        iconHeight: 18.w,
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h),
                  Divider(
                    thickness: 1.5.sp,
                    indent: 90.sp,
                    color: AppColors.lightBabyBlue,
                    endIndent: 70.sp,
                  ),
                  SizedBox(height: 24.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "اختر الفحص المطلوب",
                        style: TextStyles.font17Weight700Blue,
                      ),
                      SizedBox(width: 8.w),
                      SvgPicture.asset(
                        "assets/svgs/material-symbols_lab-panel-outline.svg",
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h),
                  ChooseTheRequiredMedicalExamination(),
                  SizedBox(height: 16.h),
                  ChooseTheRequiredMedicalExamination(
                    nameOfExamination: "فحص دم",
                  ),
                  SizedBox(height: 16.h),
                  ChooseTheRequiredMedicalExamination(
                    nameOfExamination: "صورة اشعة",
                  ),
                  SizedBox(height: 16.h),
                  ChooseTheRequiredMedicalExamination(
                    nameOfExamination: "فحص دم",
                  ),
                ],
              );
              // SizedBox(height: 32.11.h),

              // SizedBox(height: 24.h),
              // Divider(
              //   thickness: 1.5.sp,
              //   indent: 90.sp,
              //   color: AppColors.lightBabyBlue,
              //   endIndent: 70.sp,
              // ),
              // SizedBox(height: 24.h),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     Text("صرف روشتة", style: TextStyles.font17Weight700Blue),
              //     SizedBox(width: 8.w),
              //     SvgPicture.asset("assets/svgs/mingcute_paper-line.svg"),
              //   ],
              // ),

              //             },
              //           ),
              //         ),
              //       ),
              //     );
              //   }
              // })
            },
          ),
        ),
      ),
    );
  }
}
