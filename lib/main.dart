import 'package:birth_picker/birth_picker.dart';
import 'package:dr_hakeem/core/routing/page_router.dart';
import 'package:dr_hakeem/core/theming/colors.dart';
import 'package:dr_hakeem/features/doctor/view.dart';
import 'package:dr_hakeem/features/splash/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      child: MaterialApp(
        builder: (context, widget) {
          final mediaQuery = MediaQuery.of(context);
          return MediaQuery(
            data: mediaQuery.copyWith(textScaler: TextScaler.linear(1.0)),
            child: widget!,
          );
        },
        debugShowCheckedModeBanner: false,

        title: 'Dr_Hakeem',
        navigatorKey: navigatorKey,

        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: SplashPage(),
      ),
    );
  }
}
