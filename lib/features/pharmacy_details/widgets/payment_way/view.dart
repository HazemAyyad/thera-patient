import 'package:dr_hakeem/core/shared_widgets/custom_button.dart';
import 'package:dr_hakeem/features/pharmacy_details/widgets/payment_way/widgets/custom_button_payment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/colors.dart' show AppColors;
import '../../../../core/theming/styles.dart';
import 'cubit.dart';
import 'state.dart';

class PaymentWayPage extends StatelessWidget {
  const PaymentWayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => PaymentWayCubit(),
      child: Center(
        child: Dialog(
          insetPadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.sp),
          ),
          child: SizedBox(
            width: 345.w,
            height: 300.h,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
              child: BlocBuilder<PaymentWayCubit, PaymentWayState>(
                builder: (context, state) {
                  final cubit = BlocProvider.of<PaymentWayCubit>(context);
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("50 ILS", style: TextStyles.font16Weight400Blue),
                          Text(
                            "طريقة الدفع",
                            style: TextStyles.font17Weight700OriginBlack,
                          ),
                        ],
                      ),
                      SizedBox(height: 24.h),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "نقدا عند الاستلام",
                            style: TextStyles.font15Weight400Black,
                          ),
                          Radio<int>(
                            value: 0,
                            side: BorderSide(
                              width: 1.w,
                              color: AppColors.bGrey,
                            ),
                            groupValue: cubit.selectedPaymentIndex,
                            onChanged: (value) {
                              cubit.selectPayment(value!);
                            },
                            activeColor: AppColors.blueColor,
                            visualDensity: VisualDensity.compact,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                          ),
                        ],
                      ),
                      SizedBox(height: 14.h),

                      // دفع الكتروني
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "دفع الكتروني",
                            style: TextStyles.font15Weight400Black,
                          ),
                          Radio<int>(
                            value: 1,
                            side: BorderSide(
                              width: 1.w,
                              color: AppColors.bGrey,
                            ),
                            groupValue: cubit.selectedPaymentIndex,
                            onChanged: (value) {
                              cubit.selectPayment(value!);
                            },
                            activeColor: AppColors.blueColor,
                            visualDensity: VisualDensity.compact,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                          ),
                        ],
                      ),
                      SizedBox(height: 14.h),

                      // دين
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("دين", style: TextStyles.font15Weight400Black),
                          Radio<int>(
                            value: 2,
                            side: BorderSide(
                              width: 1.w,
                              color: AppColors.bGrey,
                            ),
                            groupValue: cubit.selectedPaymentIndex,
                            onChanged: (value) {
                              cubit.selectPayment(value!);
                            },
                            activeColor: AppColors.blueColor,
                            visualDensity: VisualDensity.compact,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                          ),
                        ],
                      ),
                      SizedBox(height: 22.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomButton(
                            text: "تأكيد الدفع",
                            width: 177.w,
                            height: 40.h,
                            textStyle: TextStyles.font15Weight400White,
                            onPressed: () {},
                          ),
                          SizedBox(width: 8.w),
                          CustomButtonPayment(
                             isDelivered: cubit.isDelivered,
                            onTap: () {
                              cubit.delivered();
                            },
                            text: "طلب توصيل",
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
