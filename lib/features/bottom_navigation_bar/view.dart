import 'package:dr_hakeem/features/bottom_navigation_bar/cubit.dart';
import 'package:dr_hakeem/features/bottom_navigation_bar/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavigationBarPage extends StatelessWidget {
  const BottomNavigationBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BottomNavigationBarCubit(),
      child: BlocBuilder<BottomNavigationBarCubit, BottomNavigationBarState>(
        builder: (context, state) {
          final controller = BlocProvider.of<BottomNavigationBarCubit>(context);

          return Scaffold(
            extendBody: true,
            body: controller.screens[controller.index],

            bottomNavigationBar: Padding(
              padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 69.w),
              child: Container(
                width: 255.w,
                height: 52.h,
                padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50.sp),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 8.sp,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildIcon(
                      context,
                      imageUrlSelected: "assets/svgs/solar_user-linear (2).svg",
                      imageUrl: "assets/svgs/solar_user-linear.svg",
                      index: 2,
                      isSelected: controller.index == 2,
                    ),
                    _buildIcon(
                      imageUrlSelected: "assets/svgs/guidance_search (1).svg",
                      imageUrl: "assets/svgs/guidance_search.svg",
                      context,

                      index: 1,
                      isSelected: controller.index == 1,
                    ),
                    _buildIcon(
                      context,
                      imageUrl: "assets/svgs/majesticons_home-line (2).svg",
                      imageUrlSelected:
                          "assets/svgs/majesticons_home-line (1).svg",

                      index: 0,
                      isSelected: controller.index == 0,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildIcon(
    BuildContext context, {
    required String imageUrl,
    required String imageUrlSelected,
    required int index,
    required bool isSelected,
  }) {
    final cubit = context.read<BottomNavigationBarCubit>();

    return GestureDetector(
      onTap: () => cubit.updateIndex(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: 45.w,
        height: 45.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: isSelected
              ? const LinearGradient(
                  colors: [Color(0xFF29ABE2), Color(0xFF00A99D)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : null,
        ),
        child: SvgPicture.asset(
          isSelected ? imageUrlSelected : imageUrl,
          width: 22.w,
          height: 22.w,
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }
}
