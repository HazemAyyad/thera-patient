import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/styles.dart' show TextStyles;

class ContainerOfLab extends StatelessWidget {
  final String imageText;
  final String text;

  const ContainerOfLab({
    super.key,
    required this.imageText,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(imageText, fit: BoxFit.fill, width: 65.w, height: 65.w),
        SizedBox(height: 20.h),
        Text(text, style: TextStyles.font14Weight700Green),
      ],
    );
  }
}
