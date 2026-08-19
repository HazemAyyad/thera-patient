import 'package:dr_hakeem/core/shared_widgets/custom_button.dart';
import 'package:dr_hakeem/features/register_pages/widgets/set_finger_print_view/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/routing/page_router.dart';
import '../../../core/shared_widgets/custom_no_colored_button.dart';
import '../../../core/shared_widgets/dropDownButton.dart'
    show DropdownButtonWidget;
import '../../../core/theming/colors.dart' show AppColors;
import '../../../core/theming/styles.dart';
import '../../bottom_navigation_bar/view.dart';
import '../../home_screen/view.dart';
import '../widgets/face_id/view.dart' show FaceIDBottomSheet;
import 'cubit.dart';
import 'state.dart';

class ThirdRegsterScreenPage extends StatelessWidget {
  const ThirdRegsterScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ThirdRegsterScreenCubit(),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<ThirdRegsterScreenCubit, ThirdRegsterScreenState>(
            builder: (context, state) {
              final cubit = BlocProvider.of<ThirdRegsterScreenCubit>(context);

              return ListView(
                padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {

                          MagicRouter.navigateTo(BottomNavigationBarPage());
                        },
                        child: Text(
                          "تخطي",
                          style: TextStyles.font16Weight400Green,
                        ),
                      ),
                      SizedBox(width:70.w),
                      Image.asset(
                        "assets/images/second_logo.png",
                        fit: BoxFit.fill,
                        width: 140.w,
                        height: 82.h,
                      ),
                    ],
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: 10.h),
                    child: Text(
                      textAlign: TextAlign.end,
                      "إنشاء حساب جديد",
                      style: TextStyles.font20Weight700Black,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Image.asset("assets/images/Group 34273 (3).png"),
                  SizedBox(height: 20.h),
                  Text(
                    "زمرة الدم",
                    textAlign: TextAlign.end,
                    style: TextStyles.font15Weight400FourthBlack,
                  ),
                  SizedBox(height: 10.h),
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
                  SizedBox(height: 30.h),
                  CustomNoColoredButton(
                    iconImage: "assets/svgs/humbleicons_fingerprint.svg",
                    hasImage: true,
                    text: "بصمة الأصبع",
                    onPressed: () {
                      SetFingerPrintBottomSheet.show(context);
                    },
                  ),
                  SizedBox(height: 30.h),
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
                  SizedBox(height: 200.h),
                  CustomButton(
                    text: "إنشاء حساب جديد",
                    onPressed: () {
                      MagicRouter.navigateTo(BottomNavigationBarPage());
                    },
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
