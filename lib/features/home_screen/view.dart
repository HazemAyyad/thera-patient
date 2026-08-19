import 'package:dr_hakeem/core/routing/page_router.dart';
import 'package:dr_hakeem/features/doctor/view.dart';
import 'package:dr_hakeem/features/home_screen/widget/create_new_account_buttom_sheet.dart';
import 'package:dr_hakeem/features/home_screen/widget/custom_card_of_department.dart';
import 'package:dr_hakeem/features/home_screen/widget/custom_card_with_image.dart'
    show
        Detailscontainer,
        AppointmentCard,
        InwardCutCard,
        InwardCutWithImage,
        CustomCardWithImage;
import 'package:dr_hakeem/features/lab/view.dart';
import 'package:dr_hakeem/features/medicine/view.dart';
import 'package:dr_hakeem/features/pharmacy/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/theming/styles.dart';
import '../register_pages/widgets/set_finger_print_view/view.dart';
import 'widget/custom_card_with_image.dart' show Detailscontainer;
import 'cubit.dart';
import 'state.dart';

class HomeScreenPage extends StatelessWidget {
  const HomeScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeScreenCubit(),
      child: Scaffold(
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.only(
              bottom: 20.h,
              left: 0.w,
              right: 30.w,
              top: 0.h,
            ),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/images/second_logo.png",
                    width: 120.w,
                    height: 120.w,
                    fit: BoxFit.contain,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(height: 17.h),
                      Text(
                        "..مرحبًا محمد",
                        style: TextStyles.font20Weight700Black,
                      ),
                      SizedBox(height: 20.h),
                      Text(
                        "كن بصحة جيدة دائمًا",
                        style: TextStyles.font14Weight400Black,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              CustomCardWithImage(),
              SizedBox(height: 50.h),
              Padding(
                padding: EdgeInsets.only(left: 24.w),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              MagicRouter.navigateTo(PharmacyPage());
                            },
                            child: Image.asset(
                              "assets/images/Group 34948.png",
                              width: 165.w,
                              height: 94.h,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),

                        // Expanded(
                        //   child: CustomCardOfDepartment(
                        //     onTap: () {
                        //       MagicRouter.navigateTo(PharmacyPage());
                        //     },
                        //     isRed: false,
                        //     text: "صيدلية",
                        //     imageText: "assets/svgs/Group 34946 (1).svg",
                        //   ),
                        // ),
                        SizedBox(width: 16.w),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              MagicRouter.navigateTo(DoctorPage());
                            },
                            child: Image.asset(
                              "assets/images/Group 34947 (1).png",
                              width: 165.w,
                              height: 94.h,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),

                        // Expanded(
                        //   child: CustomCardOfDepartment(
                        //     onTap: () {
                        //       MagicRouter.navigateTo(DoctorPage());
                        //     },
                        //     isRed: false,
                        //     text: "طبيب",
                        //     imageText: "assets/svgs/Group 34946.svg",
                        //   ),
                        // ),
                      ],
                    ),
                    SizedBox(height: 32.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              MagicRouter.navigateTo(MedicinePage());
                            },
                            child: Image.asset(
                              "assets/images/Group 34950.png",
                              width: 165.w,
                              height: 94.h,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        // Expanded(
                        //   child: CustomCardOfDepartment(
                        //     onTap: () {
                        //       MagicRouter.navigateTo(MedicinePage());
                        //     },
                        //     isRed: false,
                        //     text: "متابعة ادويتي",
                        //     imageText: "assets/svgs/Group 34946 (2).svg",
                        //   ),
                        // ),
                        SizedBox(width: 16.w),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              MagicRouter.navigateTo(LabPage());
                            },
                            child: Image.asset(
                              "assets/images/Group 34949.png",
                              width: 165.w,
                              height: 94.h,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        // Expanded(
                        //   child: CustomCardOfDepartment(
                        //     onTap: () {
                        //       MagicRouter.navigateTo(LabPage());
                        //     },
                        //     isRed: false,
                        //     text: "مختبر طبي",
                        //     imageText: "assets/svgs/Group 34946 (3).svg",
                        //   ),
                        // ),
                      ],
                    ),
                    SizedBox(height: 32.h),
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              SetFingerPrintBottomSheet.show(context);
                            },
                            child: Image.asset(
                              "assets/images/Group 34952.png",
                              width: 165.w,
                              height: 94.h,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        // Expanded(
                        //   child: CustomCardOfDepartment(
                        //     isRed: true,
                        //     onTap: () {
                        //       SetFingerPrintBottomSheet.show(context);
                        //     },
                        //     text: "أنقذ حياتي",
                        //     imageText: "assets/svgs/Group 34946 (4).svg",
                        //   ),
                        // ),
                        SizedBox(width: 16.w),
                        Expanded(
                          child: InkWell(
                            onTap: () async {
                              MagicRouter.navigateTo(
                                await showModalBottomSheet(
                                  context: context,
                                  builder: (context) =>
                                      CreateNewAccountButtomSheet(),
                                ),
                              );
                            },
                            child: Image.asset(
                              "assets/images/Group 34951.png",
                              width: 165.w,
                              height: 94.h,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),

                        // Expanded(
                        //   child: CustomCardOfDepartment(
                        //     onTap: () async {
                        //       MagicRouter.navigateTo(
                        //         await showModalBottomSheet(
                        //           context: context,
                        //           builder: (context) =>
                        //               CreateNewAccountButtomSheet(),
                        //         ),
                        //       );
                        //     },
                        //     isRed: false,
                        //     text: "إضافة حساب تابع",
                        //     imageText: "assets/svgs/Group 34946 (7).svg",
                        //   ),
                        // ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
