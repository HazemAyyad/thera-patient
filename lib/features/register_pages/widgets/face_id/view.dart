import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:local_auth/local_auth.dart';
import 'cubit.dart';
import 'state.dart';
import '../../../../core/shared_widgets/custom_button.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/theming/colors.dart';

class FaceIDBottomSheet {
  static bool _isOpen = false;

  static Future<bool?> show(BuildContext context) async {
    if (_isOpen) return null;
    _isOpen = true;
    final LocalAuthentication localAuth = LocalAuthentication();
    bool? result = await showModalBottomSheet<bool>(
      context: context,
      isDismissible: false,
      enableDrag: false,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
      ),
      constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width),
      builder: (context) {
        return BlocProvider(
          create: (_) => FaceIDCubit(localAuth),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: BlocConsumer<FaceIDCubit, FaceIDState>(
              listener: (context, state) {
                if (state is FaceIDSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Face ID Authentication successful!',
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: AppColors.blueColor,
                    ),
                  );
                  Navigator.of(context).pop(true);
                } else if (state is FaceIDFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        state.message,
                        style: const TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              builder: (context, state) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "يرجى استخدام بصمة الوجه",
                      textAlign: TextAlign.center,
                      style: TextStyles.font18Weight700Blue,
                    ),
                    const SizedBox(height: 20),
                    SvgPicture.asset("assets/svgs/FaceID.svg", height: 100),
                    const SizedBox(height: 30),
                    state is FaceIDLoading
                        ? const CircularProgressIndicator()
                        : SizedBox(
                            width: double.infinity,
                            child: CustomButton(
                              text: "إستخدم بصمة الوجه",
                              onPressed: () {
                                context.read<FaceIDCubit>().authenticateFaceId();
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
    return null;

  }
}
