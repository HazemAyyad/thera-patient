import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/theming/colors.dart';
import '../../../core/theming/styles.dart';

class ChooseTheRequiredMedicalExamination extends StatelessWidget {
  final String? nameOfExamination;
  const ChooseTheRequiredMedicalExamination({super.key, this.nameOfExamination});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 345.w,
      height: 95.h,
      decoration: BoxDecoration(color: AppColors.babyBlueColor,
      borderRadius: BorderRadius.circular(10.sp)
      ),
         child:

            Padding(padding: EdgeInsets.symmetric(vertical: 16.h,horizontal: 16.w),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text("8/8/2025", style: TextStyles.font12Weight400Green),
                   SizedBox(height: 8.h,)
                      ,SvgPicture.asset("assets/svgs/Group 34984 (1).svg",width: 34.w,height: 34.w,fit: BoxFit.contain,)
                    ],
                  ),
                  Column(crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                    Text(nameOfExamination??"صورة اشعة",style: TextStyles.font14Weight700OriginBlack,)
                ,
                    SizedBox(height: 16.h,),
                    Text("د. هشام حمايل",style: TextStyles.font13Weight700LightenGrey,)

                 ] ),
                ],
              ),
            )
    );
  }
}
