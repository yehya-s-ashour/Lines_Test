import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lines_co_test/core/cubit/nav_bar/nav_bar_cubit.dart';
import 'package:lines_co_test/screens/main_screen/custom_nav_bar.dart';

class MainScreen extends StatelessWidget {
  final int initialIndex;
  final Widget? targetPage;

  MainScreen({this.initialIndex = 0, this.targetPage});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          NavBarCubit(targetPage: targetPage)..updateIndex(initialIndex),
      child: BlocBuilder<NavBarCubit, int>(
        builder: (context, selectedIndex) {
          final navBarCubit = context.read<NavBarCubit>();
          return Scaffold(
            body: Column(
              children: [
                Expanded(
                  child: navBarCubit.pages[selectedIndex],
                ),
              ],
            ),
            bottomNavigationBar: PreferredSize(
              preferredSize: Size.fromHeight(56.0),
              child: CustomNavBar(),
            ),
          );
        },
      ),
    );
  }
}
