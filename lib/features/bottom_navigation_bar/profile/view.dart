import 'package:dr_hakeem/core/routing/page_router.dart';
import 'package:dr_hakeem/core/theming/colors.dart';
import 'package:dr_hakeem/features/bottom_navigation_bar/profile/widgets/health_information/view.dart';
import 'package:dr_hakeem/features/bottom_navigation_bar/profile/widgets/log_out.dart';
import 'package:dr_hakeem/features/bottom_navigation_bar/profile/widgets/password/view.dart';
import 'package:dr_hakeem/features/bottom_navigation_bar/profile/widgets/social_information/view.dart'
    show SocialInformationPage;
import 'package:dr_hakeem/features/bottom_navigation_bar/profile/widgets/special_information/view.dart'
    show SpecialInformationPage;
import 'package:dr_hakeem/features/bottom_navigation_bar/profile/widgets/type_of_setings.dart';
import 'package:dr_hakeem/features/medicine/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/theming/styles.dart' show TextStyles;
import 'cubit.dart';
import 'state.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ProfileCubit(),
      child: Scaffold(
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),

            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "assets/images/image-removebg-preview (1) 1.png",
                    width: 47.w,
                    height: 54.h,
                    fit: BoxFit.contain,
                  ),

                  Text("الملف الشخصي", style: TextStyles.font20Weight800Black),
                ],
              ),
              SizedBox(height: 24.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "زايد محمد زايد محمد",
                    style: TextStyles.font18Weight700Blue,
                  ),
                  SizedBox(width: 16.w),
                  Container(
                    width: 65.w,
                    height: 65.w,
                    decoration: BoxDecoration(
                      color: AppColors.whiteGreyColor,
                      borderRadius: BorderRadius.circular(65.sp),
                    ),
                    child: SvgPicture.asset(
                      "assets/svgs/solar_user-broken.svg",
                      width: 40.w,
                      height: 40.w,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              Text(
                textAlign: TextAlign.end,
                "إعدادات الملف",
                style: TextStyles.font16Weight700LightenGrey,
              ),
              SizedBox(height: 24.h),
              TypeOfSettings(
                onTap: () {
                  MagicRouter.navigateTo(SpecialInformationPage());
                },
                iconWidth: 26.w,
                iconHeight: 26.w,
                settingName: "المعلومات الشخصية",
                isRed: false,
              ),
              SizedBox(height: 24.h),
              TypeOfSettings(
                iconWidth: 26.w,
                onTap: () {
                  MagicRouter.navigateTo(SocialInformationPage());
                },
                iconHeight: 26.w,
                settingName: "المعلومات الأجتماعية",
                imageUrl: "assets/svgs/ion_social-buffer.svg",
                isRed: false,
              ),
              SizedBox(height: 24.h),
              TypeOfSettings(
                iconWidth: 26.w,
                iconHeight: 26.w,
                onTap: () {
                  MagicRouter.navigateTo(HealthInformationPage());
                },
                imageUrl: "assets/svgs/solar_health-broken.svg",
                settingName: "المعلومات الصحية",
                isRed: false,
              ),
              SizedBox(height: 24.h),
              TypeOfSettings(
                onTap: () {
                  MagicRouter.navigateTo(PasswordPage());
                },
                iconWidth: 26.w,
                iconHeight: 26.w,
                settingName: "كلمة المرور",
                imageUrl: "assets/svgs/solar_lock-password-broken.svg",
                isRed: false,
              ),
              SizedBox(height: 24.h),
              TypeOfSettings(
                iconHeight: 28.w,
                iconWidth: 28.w,
                imageUrl: "assets/svgs/healthicons_medicines-outline.svg",
                settingName: "ادويتي",
                isRed: false,
                onTap: () {
                  MagicRouter.navigateTo(MedicinePage());
                },
              ),
              SizedBox(height: 24.h),
              TypeOfSettings(
                onTap: () async {
                  MagicRouter.navigateTo(await showDialog(
                      context: context, builder: (context) => LogOut()));
                },
                iconHeight: 24.w,
                iconWidth: 24.w,
                imageUrl: "assets/svgs/solar_logout-broken.svg",
                settingName: "تسجيل الخروج",
                isRed: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
