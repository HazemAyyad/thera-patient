import 'package:dr_hakeem/core/shared_widgets/grey_container.dart';
import 'package:dr_hakeem/core/theming/colors.dart';
import 'package:dr_hakeem/features/pharmacy_details/widgets/Prescription.dart';
import 'package:dr_hakeem/features/pharmacy_details/widgets/payment_way/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/routing/page_router.dart';
import '../../core/theming/styles.dart';
import '../../core/shared_widgets/container_of_doctor_details.dart';
import 'cubit.dart';
import 'state.dart';

class PharmacyDetailsPage extends StatelessWidget {
  const PharmacyDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => PharmacyDetailsCubit(),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<PharmacyDetailsCubit, PharmacyDetailsState>(
            builder: (context, state) {
              final cubit = BlocProvider.of<PharmacyDetailsCubit>(context);
              return ListView(
                padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        "assets/svgs/share.svg",
                        width: 38.w,
                        height: 38.w,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(width: 145.w),
                      Text(
                        "تفاصيل الصيدلية",
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
                    isFavorite: cubit.isFavorite,
                    addFavorite: cubit.addFavorite,
                    hasImage: false,
                    phoneNumber: "+970 599XXXXXX",
                    buttonText: "بيتا - نابلس",
                    name: "صيدلية مرفق",
                    imageUrl: "assets/images/Rectangle 21.png",
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
                      Text("صرف روشتة", style: TextStyles.font17Weight700Blue),
                      SizedBox(width: 8.w),
                      SvgPicture.asset("assets/svgs/mingcute_paper-line.svg"),
                    ],
                  ),
                  SizedBox(height: 24.h),
                  Prescription(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => PaymentWayPage(),
                      );
                    },
                  ),
                  SizedBox(height: 16.h),
                  Prescription(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
