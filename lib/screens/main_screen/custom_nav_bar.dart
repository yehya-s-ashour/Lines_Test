import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart'; // Import Google Fonts package
import 'package:lines_co_test/core/cubit/nav_bar/nav_bar_cubit.dart';
import 'package:lines_co_test/core/utils/colors.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({super.key});

  @override
  _CustomNavBarState createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    final navBarCubit = context.read<NavBarCubit>();
    _tabController =
        TabController(length: navBarCubit.icons.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        left: 10.w,
      ),
      margin: EdgeInsets.only(bottom: 7.h),
      height: 60.h,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: BlocBuilder<NavBarCubit, int>(
        builder: (context, selectedIndex) {
          final navBarCubit = context.read<NavBarCubit>();
          _tabController.index = selectedIndex;
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(navBarCubit.icons.length, (index) {
              return Expanded(
                child: InkWell(
                  onTap: () => navBarCubit.updateIndex(index),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        selectedIndex == index
                            ? navBarCubit.blueIcons[index]
                            : navBarCubit.icons[index],
                        width: 24.0.w,
                        height: 24.0.h,
                      ),
                      Text(
                        navBarCubit.getTitle(index),
                        style: GoogleFonts.poppins(
                          // Use Poppins font
                          textStyle: selectedIndex == index
                              ? Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    color: AppColors.kPrimaryLightBlue,
                                    fontWeight: FontWeight.w500,
                                  )
                              : Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    color: Color(0xffBBBBBB),
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
