import 'package:dr_hakeem/core/theming/colors.dart';
import 'package:dr_hakeem/features/calender/widgets/choose_suitable_date.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../core/theming/styles.dart';
import 'cubit.dart';
import 'state.dart';

class CalenderPage extends StatelessWidget {
  const CalenderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CalenderCubit(),
      child: BlocBuilder<CalenderCubit, CalenderState>(
        builder: (context, state) {
          final cubit = context.read<CalenderCubit>();

          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.sp),
            ),
            insetPadding: const EdgeInsets.all(16),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TableCalendar(
                    locale: 'en',
                    focusedDay: state.focusedDate,
                    firstDay: DateTime.utc(2025, 11, 1),
                    lastDay: DateTime.utc(2030, 12, 31),
                    startingDayOfWeek: StartingDayOfWeek.sunday,
                    selectedDayPredicate: (day) =>
                        isSameDay(day, state.selectedDate),
                    onDaySelected: (selected, focused) {
                      cubit.selectDate(selected);
                      cubit.changeMonth(focused);
                      final isAvailable = state.availableDays.any(
                        (d) => isSameDay(d, selected),
                      );
                      if (isAvailable) {
                        showDialog(
                          context: context,
                          builder: (context) => ChooseSuitableDate(),
                        );
                      }
                    },
                    onPageChanged: (focused) => cubit.changeMonth(focused),
                    daysOfWeekHeight: 48.h,
                    daysOfWeekStyle: const DaysOfWeekStyle(),

                    calendarStyle: CalendarStyle(
                      todayDecoration: BoxDecoration(
                        color: AppColors.strongBlue,

                        shape: BoxShape.rectangle,
                      ),
                      selectedDecoration: const BoxDecoration(
                        color: AppColors.blueColor,
                        shape: BoxShape.rectangle,
                      ),
                      defaultDecoration: const BoxDecoration(
                        shape: BoxShape.rectangle,
                      ),
                      outsideDaysVisible: false,
                    ),

                    calendarBuilders: CalendarBuilders(
                      // Weekday letters
                      dowBuilder: (context, day) {
                        const letters = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];

                        return Container(
                          height: 48.w,
                          width: 48.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.greyColor,
                              width: 1.w,
                            ),
                          ),
                          child: Text(
                            letters[day.weekday - 1],
                            style: TextStyles.font16Weight600OriginBlack,
                            textAlign: TextAlign.center,
                          ),
                        );
                      },

                      defaultBuilder: (context, day, focusedDay) {
                        final isAvailable = state.availableDays.any(
                          (d) => isSameDay(d, day),
                        );
                        final isUnavailable = state.unavailableDays.any(
                          (d) => isSameDay(d, day),
                        );

                        Color? bgColor;
                        if (isUnavailable) bgColor = AppColors.lightOrange;

                        return Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: bgColor,
                                shape: BoxShape.rectangle,
                                border: Border.all(
                                  color: AppColors.greyColor,
                                  width: 1.w,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  '${day.day}',
                                  style:
                                      TextStyles.font16Weight600OriginBlack,
                                ),
                              ),
                            ),
                            if (isAvailable)
                              const Positioned(
                                bottom: 4,
                                child: Icon(
                                  Icons.circle,
                                  color: Colors.green,
                                  size: 10,
                                ),
                              ),
                          ],
                        );
                      },
                    ),
                    headerStyle: HeaderStyle(
                      titleCentered: false,
                      formatButtonVisible: false,
                      leftChevronVisible: false,
                      rightChevronVisible: false,
                      titleTextStyle: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w800,
                        color: AppColors.originBlack,
                        letterSpacing: 0,
                        height: 1,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "متاح",
                            style: TextStyles.font12Weight400OriginBlack,
                          ),
                          SizedBox(width: 4.w),
                          const Icon(
                            Icons.circle,
                            color: Colors.green,
                            size: 10,
                          ),
                        ],
                      ),
                      SizedBox(width: 5.w),
                      SvgPicture.asset(
                        "assets/svgs/Rectangle 16.svg",
                        width: 20.w,
                        height: 20.w,
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        "غير متاح",
                        style: TextStyles.font12Weight400OriginBlack,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
