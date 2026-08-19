import 'package:dr_hakeem/core/routing/page_router.dart';
import 'package:dr_hakeem/core/shared_widgets/custom_button.dart';
import 'package:dr_hakeem/core/theming/colors.dart';
import 'package:dr_hakeem/features/register_pages/first_register_screen/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateNewAccountButtomSheet extends StatelessWidget {
  const CreateNewAccountButtomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(alignment: Alignment.center,
      width: 393.w,
      height: 176.h,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(10.sp),
      ),
      child: CustomButton(text: "إنشاء حساب جديد تابع",


          onPressed: () {MagicRouter.navigateTo(FirstRegisterPage());}),
    );
  }
}
