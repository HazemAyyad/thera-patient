import 'package:dr_hakeem/features/save_my_life/widgets/container_of_save_my_life.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/routing/page_router.dart' show MagicRouter;
import '../../core/theming/styles.dart';
import 'cubit.dart';

class SaveMyLifePage extends StatelessWidget {
  const SaveMyLifePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SaveMyLifeCubit(),
      child: Scaffold(
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("أنقذ حياتي", style: TextStyles.font18Weight700Black),
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
              SizedBox(height: 24.h),
              Text(
                textAlign: TextAlign.end,
                "إسم المريض الرباعي",
                style: TextStyles.font17Weight700Blue,
              ),
              SizedBox(height: 17.h),
              Text(
                textAlign: TextAlign.end,
                "العمر: 45 سنة",
                style: TextStyles.font13Weight700LightenGrey,
              ),
              SizedBox(height: 16.h),
              RichText(
                textAlign: TextAlign.end,
                text: TextSpan(
                  children: [
                    TextSpan(text: "+A", style: TextStyles.font13Weight700Red),
                    TextSpan(
                      text: " :زمرة الدم",
                      style: TextStyles.font13Weight700LightenGrey,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              ContainerOfSaveMyLife(
                firstText: "امراض مزمنة",
                secondText: "1- مرض سكري",
                thirdText: "2- مرض سكري",
                hasThird: true,
              ),
              SizedBox(height: 16.h),
              ContainerOfSaveMyLife(
                firstText: "الأدوية الحالية",
                secondText: "1- اسم الدواء الاول",
                thirdText: "2- اسم الدواء الثاني",
                hasThird: true,
              ),
              SizedBox(height: 16.h),
              ContainerOfSaveMyLife(
                firstText: "الحساسية",
                secondText: "1- الحساسية الاولي",
                thirdText: "",
                hasThird: false,
              ),
              SizedBox(height: 24.h),
              Text(
                textAlign: TextAlign.end,
                "جهات الاتصال في حالة الطوارئ",
                style: TextStyles.font17Weight700Blue,
              ),
              SizedBox(height: 16.h),
              ContainerOfSaveMyLife(
                firstText: "إسم الشخص الاول",
                secondText: "+970 8711515515",
                thirdText: "",
                hasThird: false,

              ),
              SizedBox(height: 16.h),
              ContainerOfSaveMyLife(
                firstText: "إسم الشخص الثاني",
                secondText: "+970 8711515515",
                thirdText: "",
                hasThird: false,

              ),
            ],
          ),
        ),
      ),
    );
  }
}
