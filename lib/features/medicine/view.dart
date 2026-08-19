import 'package:dr_hakeem/core/routing/page_router.dart' show MagicRouter;
import 'package:dr_hakeem/core/shared_widgets/custom_button_with_radial_gradiant.dart';
import 'package:dr_hakeem/features/medicine/widgets/container_of_medicine_details.dart';
import 'package:dr_hakeem/features/medicine/widgets/reminderOfTimeOfMedicine.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/theming/styles.dart';
import 'cubit.dart';
import 'state.dart';

class MedicinePage extends StatelessWidget {
  const MedicinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => MedicineCubit(),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<MedicineCubit, MedicineState>(
            builder: (context, state) {
              final cubit = BlocProvider.of<MedicineCubit>(context);
              return ListView(
                padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),

                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomButtonWithRadialGradiant(

                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(10.sp),
                              ),
                            ),
                            builder: (BuildContext context) {
                              String? localSelectedPeriod =
                                  cubit.selectedPeriod;

                              return StatefulBuilder(
                                builder: (context, setModalState) {
                                  return ReminderOfTimeOfMedicine(
                                    selectedPeriod: localSelectedPeriod,
                                    onChanged: (value) {
                                      setModalState(
                                        () => localSelectedPeriod = value,
                                      );
                                      cubit.onChangedPeriod(value);
                                    },
                                  );
                                },
                              );
                            },
                          );
                        },
                        width: 157.w,
                        height: 38.h,
                        hasImage: true,
                        text: "إضافة موعد دواء جديد",
                      ),
                      Row(
                        children: [
                          Text(
                            "متابعة الأدوية",
                            style: TextStyles.font18Weight700Black,
                          ),
                          SizedBox(width: 8.w),
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
                  SizedBox(height: 27.h),
                  Text(
                    textAlign: TextAlign.end,
                    "الأدوية الموصوفة",
                    style: TextStyles.font15Weight700Black,
                  ),
                  SizedBox(height: 24.h),
                  ContainerOfMedicineDetails(),
                  SizedBox(height: 16.h),
                  ContainerOfMedicineDetails(),
                  SizedBox(height: 16.h),
                  ContainerOfMedicineDetails(),
                  SizedBox(height: 16.h),
                  ContainerOfMedicineDetails(),
                  SizedBox(height: 16.h),
                  ContainerOfMedicineDetails(),
                  SizedBox(height: 16.h),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
