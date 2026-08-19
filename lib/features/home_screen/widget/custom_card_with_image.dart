import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/theming/styles.dart' show TextStyles;

class CustomCardWithImage extends StatelessWidget {
  const CustomCardWithImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: 20.w),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            "assets/images/Subtract (2).png",
            width: 440.w,
            fit: BoxFit.fill,
          ),
          Positioned(
            top: 10,
            right: 15,
            child: SvgPicture.asset(
              "assets/svgs/Group 10.svg",
              width: 30,
              height: 30,
            ),
          ),
          Positioned(
            top: 20,
            right: 30,
            left: 30.w,
            child: Row(

              children: [
                 Text(
                  "د/علي احمد",
                  style:TextStyles.font14Weight400White
                ),
                SizedBox(width: 25.w,),
                Text(
                  "10/8/2025",
                  style: TextStyles.font14Weight400White
                ),
                SizedBox(width: 25.w,),
                Text(
                  "مراجعة طبية",
                    style:TextStyles.font14Weight400White
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 25.h,
            right: 75.w,
            left: 45.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text("م10:00",
                    style: TextStyle(color: Colors.white, fontSize: 16)),
                SizedBox(height: 4),
                Text("مستشفى رفيديا - رفيديا - نابلس",
                    style: TextStyle(color: Colors.white70, fontSize: 14)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
