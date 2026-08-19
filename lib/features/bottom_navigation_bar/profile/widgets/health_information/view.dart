import 'package:dr_hakeem/core/routing/page_router.dart';
import 'package:dr_hakeem/core/shared_widgets/custom_button.dart';
import 'package:dr_hakeem/features/register_pages/widgets/face_id/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart' show SvgPicture;

import '../../../../../core/shared_widgets/custom_no_colored_button.dart';
import '../../../../../core/shared_widgets/dropDownButton.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../register_pages/widgets/set_finger_print_view/view.dart'
    show SetFingerPrintBottomSheet;
import 'cubit.dart';
import 'state.dart';

class HealthInformationPage extends StatelessWidget {
  const HealthInformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HealthInformationCubit(),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<HealthInformationCubit, HealthInformationState>(
            builder: (context, state) {
              final cubit = BlocProvider.of<HealthInformationCubit>(context);
              return ListView(
                padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "المعلومات الصحية",
                        style: TextStyles.font19Weight700Black,
                      ),
                      SizedBox(width: 8.w),
                      InkWell(
                        onTap: () {
                          MagicRouter.pop();
                        },
                        child: SvgPicture.asset(
                          "assets/svgs/weui_arrow-filled (1).svg",
                          width: 13.5.w,
                          fit: BoxFit.contain,
                          height: 27.h,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 32.h),
                  Text(
                    "زمرة الدم",
                    textAlign: TextAlign.end,
                    style: TextStyles.font15Weight400FourthBlack,
                  ),
                  SizedBox(height: 8.h),
                  DropdownButtonWidget(
                    hint: "مثال: +O",
                    onChanged: cubit.onChangedBloodGroups,
                    items:
                        <String>[
                          "A+",
                          "A-",
                          "B+",
                          "B-",
                          "AB+",
                          "AB-",
                          "O+",
                          "O-",
                        ].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                    selectedGender: cubit.selectedGenderBloodGroups,
                  ),
                  SizedBox(height: 32.h),
                  CustomNoColoredButton(
                    iconImage: "assets/svgs/humbleicons_fingerprint.svg",
                    hasImage: true,
                    text: "بصمة الأصبع",
                    onPressed: () {
                      SetFingerPrintBottomSheet.show(context);
                    },
                  ),
                  SizedBox(height: 32.h),
                  CustomNoColoredButton(
                    iconImage: "assets/svgs/tabler_face-id.svg",
                    hasImage: true,
                    text: "بصمة الوجه",
                    onPressed: () async {
                      bool? success = await FaceIDBottomSheet.show(context);
                      if (success == true) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Access granted"),
                            backgroundColor: Colors.green,
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Access denied"),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
                  ),
                  SizedBox(height: 32.h),
                  CustomButton(text: "حفظ التعديلات", onPressed: () {}),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
