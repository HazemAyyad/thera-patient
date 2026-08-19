import 'package:dr_hakeem/features/doctor_details/widgets/book_appointment_container.dart';
import 'package:dr_hakeem/core/shared_widgets/container_of_doctor_details.dart';
import 'package:dr_hakeem/core/shared_widgets/grey_container.dart'
    show GreyContainer;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/routing/page_router.dart';
import '../../core/theming/styles.dart';
import 'cubit.dart';
import 'state.dart';

class DoctorDetailsPage extends StatelessWidget {
  const DoctorDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => DoctorDetailsCubit(),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<DoctorDetailsCubit, DoctorDetailsState>(
            builder: (context, state) {
              final cubit = BlocProvider.of<DoctorDetailsCubit>(context);
              return ListView(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),

                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        "assets/svgs/share.svg",
                        width: 38.w,
                        height: 38.w,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(width: 161.w),
                      Text(
                        "تفاصيل الطبيب",
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
                  SizedBox(height: 32.11.h),
                  ContainerOfDoctorDetails(
                    addFavorite: cubit.addFavorite,
                    isFavorite: cubit.isFavorite,
                  ),
                  SizedBox(height: 32.h),
                  Row(
                    children: [
                      GreyContainer(
                        text: "التقييم",
                        number: "4.6K",
                        iconUrl: "assets/svgs/flat-color-icons_like.svg",
                        iconHeight: 17.w,
                        iconWidth: 17.w,
                      ),
                      SizedBox(width: 16.w),
                      GreyContainer(
                        text: "عدد المرضي",
                        number: "2458",
                        iconUrl: "assets/svgs/gridicons_user (1).svg",
                        iconHeight: 18.w,
                        iconWidth: 18.w,
                      ),
                      SizedBox(width: 16.w),
                      GreyContainer(
                        text: "الخبرة",
                        number: "25 سنة",
                        iconUrl: "assets/svgs/Group 34977.svg",
                        iconHeight: 16.w,
                        iconWidth: 16.w,
                      ),
                    ],
                  ),
                  SizedBox(height: 32.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "أماكن التواجد والدوام",
                        style: TextStyles.font17Weight700Blue,
                      ),
                      SizedBox(width: 8.w),
                      SvgPicture.asset(
                        "assets/svgs/proicons_location (1).svg",
                        width: 20.w,
                        height: 20.w,
                        fit: BoxFit.fill,
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h),
                  Column(
                    children: [
                      BookAppointmentContainer(

                        text: "العيادة",
                        cityText: "عيادة البيت",
                      ),
                      SizedBox(height: 24.h),
                      BookAppointmentContainer(
                        text: "مستشفي رفيديا",
                        cityText: "رفيديا - جنوب نابلس",
                      ),
                      SizedBox(height: 24.h),
                      BookAppointmentContainer(
                        text: "عيادة البيت",
                        cityText: "بيتا - جنوب نابلس",
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
