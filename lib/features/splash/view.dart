import 'package:dr_hakeem/features/splash/cubit.dart';
import 'package:dr_hakeem/features/splash/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit()..startAnimation(context),
      child: BlocBuilder<SplashCubit, SplashState>(
        builder: (context, state) {
          final cubit = context.read<SplashCubit>();

          return Scaffold(
            body: AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              decoration: BoxDecoration(
                gradient: cubit.backgroundColor == Colors.white
                    ? null
                    : const RadialGradient(
                        center: Alignment.center,
                        radius: 1.2,
                        colors: [Color(0xFF29ABE2), Color(0xFF00A99D)],
                      ),
                color: cubit.backgroundColor == Colors.white
                    ? Colors.white
                    : null,
              ),
              child: Center(
                child: AnimatedScale(
                  scale: cubit.scale,
                  duration: const Duration(milliseconds: 700),
                  curve: Curves.easeOutBack,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [

                      if (cubit.backgroundColor != Colors.white) ...[
                        Container(
                          width: 320,
                          height: 320,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white.withOpacity(0.15),
                          ),
                        ),
                        Container(
                          width: 280,
                          height: 280,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white.withOpacity(0.3),
                          ),
                        ),
                        Container(
                          width: 240,
                          height: 240,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 15,
                                spreadRadius: 5,
                              ),
                            ],
                          ),
                        ),
                      ],
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 700),
                        curve: Curves.easeOutBack,
                        child: Image.asset(
                          "assets/images/logo.png",
                          width: cubit.logoSize,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
