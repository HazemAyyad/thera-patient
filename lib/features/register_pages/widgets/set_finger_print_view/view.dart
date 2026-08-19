import 'package:dr_hakeem/core/routing/page_router.dart';
import 'package:dr_hakeem/core/theming/colors.dart';
import 'package:dr_hakeem/features/register_pages/widgets/set_finger_print_view/cubit.dart';
import 'package:dr_hakeem/features/register_pages/widgets/set_finger_print_view/state.dart';
import 'package:dr_hakeem/features/save_my_life/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:local_auth/local_auth.dart';

import '../../../../core/shared_widgets/custom_button.dart';
import '../../../../core/theming/styles.dart';

class SetFingerPrintBottomSheet {
  static Future<void> show(BuildContext context) async {
    final LocalAuthentication localAuth = LocalAuthentication();

    await showModalBottomSheet(
      context: context,
      isDismissible: false,
      enableDrag: false,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
      ),
      constraints: BoxConstraints(
        maxWidth: MediaQuery
            .of(context)
            .size
            .width,
      ),
      builder: (context) {
        return BlocProvider(
          create: (_) => SetFingerPrintCubit(LocalAuthentication()),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: BlocConsumer<SetFingerPrintCubit, SetFingerPrintState>(
              listener: (context, state) {
                if (state is AuthSuccess) {

                  ScaffoldMessenger.of(context).showSnackBar(


                    const SnackBar(
                      backgroundColor: AppColors.blueColor,
                        content: Text('Authentication successful!')),
                  );
                  MagicRouter.navigateTo(SaveMyLifePage());
                } else if (state is AuthFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(backgroundColor: AppColors.blueColor,
                        content: Text(state.message)),
                  );
                }
              },
              builder: (context, state) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "يرجى إدخال بصمة الإصبع",
                      textAlign: TextAlign.center,
                      style: TextStyles.font18Weight700Blue,
                    ),
                    const SizedBox(height: 20),
                   SvgPicture.asset("assets/svgs/humbleicons_fingerprint (3).svg"),
                    const SizedBox(height: 30),
                 SizedBox(
                      width: double.infinity,
                      child: CustomButton(
                        text: "أدخل بصمة الإصبع",
                        onPressed: () {
                          context
                              .read<SetFingerPrintCubit>()
                              .authenticateWithBiometrics();
                        },
                      ),
                    ),

                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }}