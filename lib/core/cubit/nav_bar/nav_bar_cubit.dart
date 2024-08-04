import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:lines_co_test/screens/subscribtion_screen/subscribtion_screen.dart';
import 'package:lines_co_test/screens/transport_management_screen/transport_management_screen.dart';

class NavBarCubit extends Cubit<int> {
  NavBarCubit({Widget? targetPage})
      : pages = [
          TransportManagementScreen(),
          targetPage ?? SubscriptionScreen(),
          Center(child: Text('Chat')),
          Center(child: Text('Profile')),
        ],
        super(0);

  void updateIndex(int index) {
    emit(index);
  }

  String getTitle(int index) {
    switch (index) {
      case 0:
        return 'My Packages';
      case 1:
        return 'Orders';
      case 2:
        return 'Chat';
      case 3:
        return 'Profile';
      default:
        return '';
    }
  }

  final List<String> icons = [
    'assets/icons/home_icon.svg',
    'assets/icons/orders_icon.svg',
    'assets/icons/chat_icon.svg',
    'assets/icons/profile_icon.svg',
  ];

  final List<String> blueIcons = [
    'assets/icons/home_icon_blue.svg',
    'assets/icons/orders_icon_blue.svg',
    'assets/icons/chat_icon_blue.svg',
    'assets/icons/profile_icon_blue.svg',
  ];

  final List<Widget> pages;
}
