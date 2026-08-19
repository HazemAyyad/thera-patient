import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/styles.dart' show TextStyles;

class NameAndImageOfDoctor extends StatelessWidget {
  final double? height;
  final double? width;
  final String? textName;
  final String? textSpecialty ;
  final double? SizedBoxHeight;
  final String? imageUrl;
  const NameAndImageOfDoctor({super.key, this.height, this.width, this.textName, this.textSpecialty, this.SizedBoxHeight, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Image.asset(
         imageUrl?? "assets/images/image_of_doctor.png",
          width: width??164.w,
          height:height?? 184.h,
        ),
        SizedBox(height:SizedBoxHeight?? 16.h,),
        Text(textName??"د. هشام حمايل", style: TextStyles.font14Weight700Black),
        SizedBox(height: 8.h,),
        Text(textSpecialty??"طبيب عام",style: TextStyles.font13Weight400LightenGrey,)
      ],
    );
  }
}
