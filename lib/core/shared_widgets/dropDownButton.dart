import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../theming/colors.dart';
import '../theming/styles.dart';

class DropdownButtonWidget extends StatelessWidget {
  final String? selectedGender;
  final void Function(String?) onChanged;
  final String hint;
  final List<DropdownMenuItem<String>>? items;
  final double? radius;
  final double? width;
  final double? height;

  const DropdownButtonWidget({
    super.key,
    this.selectedGender,
    required this.onChanged,
    required this.hint,
    required this.items,
    this.radius,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
        color: AppColors.babyBlueColor,
        borderRadius: BorderRadius.circular(radius ?? 8.sp),
      ),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: DropdownButton<String>(

          icon: SvgPicture.asset("assets/svgs/weui_arrow-filled.svg"),
          dropdownColor: AppColors.babyBlueColor,
          hint: Text(hint,style: TextStyles.font15Weight400LightenGrey,),
          value:
              selectedGender != null &&
                  items!.any((item) => item.value == selectedGender)
              ? selectedGender
              : null,

          underline: SizedBox.shrink(),

          isExpanded: true,
          items: items,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
