import 'package:bloc/bloc.dart';
import 'package:dr_hakeem/features/bottom_navigation_bar/profile/view.dart';
import 'package:dr_hakeem/features/bottom_navigation_bar/search/view.dart';
import 'package:dr_hakeem/features/bottom_navigation_bar/state.dart';
import 'package:dr_hakeem/features/home_screen/view.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarCubit extends Cubit<BottomNavigationBarState> {
  BottomNavigationBarCubit() : super(BottomNavigationBarStateInit());

  int index = 0;
  final GlobalKey navigationKey = GlobalKey();

  final Gradient gradient = const RadialGradient(
    colors: [
      Color(0xFF29ABE2),
      Color(0xFF00A99D),
    ],
    center: Alignment.topLeft,
    radius: 1.5,
  );


  Widget gradientIcon(IconData iconData) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return gradient.createShader(bounds);
      },
      child: Icon(
        iconData,
        color: Colors.white,
      ),
    );
  }

  BottomNavigationBarItem _navItem({
    required Widget icon,
    required String label,
  }) {
    return BottomNavigationBarItem(icon: icon, label: label);
  }


  List<BottomNavigationBarItem> get items => [
    _navItem(
      icon: index == 0
          ? gradientIcon(Icons.home_outlined)
          : const Icon(Icons.home_outlined, color: Colors.grey),
      label: 'Home',
    ),
    _navItem(
      icon: index == 1
          ? gradientIcon(Icons.search)
          : const Icon(Icons.search, color: Colors.grey),
      label: 'Search',
    ),
    _navItem(
      icon: index == 2
          ? gradientIcon(Icons.person)
          : const Icon(Icons.person, color: Colors.grey),
      label: 'Profile',
    ),
  ];

  final List screens = [
     HomeScreenPage(),
     SearchPage(),
     ProfilePage(),
  ];

  void updateIndex(int newIndex) {
    index = newIndex;
    emit(UpdateIndex());
  }
}
