import 'package:dr_hakeem/core/routing/page_router.dart' show MagicRouter;
import 'package:dr_hakeem/core/shared_widgets/custom_button.dart';
import 'package:dr_hakeem/core/shared_widgets/custom_text_form_feild.dart';
import 'package:dr_hakeem/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart' show SvgPicture;

import '../../../../../core/theming/styles.dart';
import 'cubit.dart';
import 'state.dart';

class SpecialInformationPage extends StatelessWidget {
  const SpecialInformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SpecialInformationCubit(),
      child: Scaffold(
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "المعلومات الشخصية",
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
              SizedBox(height: 32.h,),
              CustomTextFormFeild(
                 fillColor: AppColors.babyBlueColor,
                hint: "زايد محمد زايد محمد",
              upperText: "الاسم الرباعي",
                starText: "",
              ),
              SizedBox(height: 17.h,),
              CustomTextFormFeild(
                fillColor: AppColors.babyBlueColor,
                hint: "zmohamed@mail.com",
                upperText: "البريد الإلكتروني",
                starText: "",
              ),
              SizedBox(height: 32.h,),
              CustomButton(text: "حفظ التعديلات",onPressed: (){},)
            ],
          ),
        ),
      ),
    );
  }
}
