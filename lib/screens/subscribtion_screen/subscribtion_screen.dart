import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart'; // Import Google Fonts package
import 'package:lines_co_test/core/cubit/subscribtion/subs_cubit.dart';
import 'package:lines_co_test/core/cubit/subscribtion/subs_states.dart';
import 'package:lines_co_test/core/utils/colors.dart';
import 'package:lines_co_test/screens/main_screen/main_screen.dart';
import 'package:lines_co_test/screens/orders_screen/orders_screen.dart';
import 'package:lines_co_test/screens/subscribtion_screen/widgets/bar_chart.dart';
import 'package:lines_co_test/screens/subscribtion_screen/widgets/subscribtion_option_content.dart';
import 'package:lines_co_test/screens/subscribtion_screen/widgets/tab_item.dart';

class SubscriptionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
    ));
    return BlocProvider(
      create: (context) => SubscriptionCubit(),
      child: BlocBuilder<SubscriptionCubit, SubscriptionState>(
        builder: (context, state) {
          final cubit = context.read<SubscriptionCubit>();

          int currentIndex = state is SubscriptionTabChanged
              ? state.currentIndex
              : state is SubscriptionOptionChanged
                  ? state.currentIndex
                  : 0;
          List<int> selectedOptionIndices = state is SubscriptionTabChanged
              ? state.selectedOptionIndices
              : state is SubscriptionOptionChanged
                  ? state.selectedOptionIndices
                  : [0, 0]; // Default selection

          return SafeArea(
            child: Scaffold(
              body: SingleChildScrollView(
                padding: EdgeInsets.zero,
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(
                      height: 30.h,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            left: 28.0.w,
                          ),
                          child: Text(
                            'LOGO',
                            style: GoogleFonts.ibmPlexSans(
                              // Updated to IBM Plex Sans
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 34.sp,
                            ),
                          ),
                        ),
                        Container(
                          height: 222.h,
                          margin: EdgeInsets.only(
                            left: 16.w,
                            right: 16.w,
                            top: 23.h,
                            bottom: 23.h,
                          ),
                          child: BarChartSample(),
                        ),
                        SizedBox(height: 20.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 16.w,
                            ),
                            TabItem(
                              isSelected: currentIndex == 0,
                              label: 'Personal',
                              iconUrl: 'assets/icons/person.png',
                              onTap: () => cubit.onTabSelected(0),
                              flex: 4,
                            ),
                            TabItem(
                              isSelected: currentIndex == 1,
                              label: 'Workspace',
                              iconUrl: 'assets/icons/person_2.png',
                              onTap: () => cubit.onTabSelected(1),
                              flex: 5,
                            ),
                            SizedBox(
                              width: 16.w,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 228.h,
                          child: PageView(
                            controller: cubit.pageController,
                            onPageChanged: (index) {
                              cubit.onPageChanged(index);
                            },
                            children: [
                              SubscriptionContent(
                                title: 'Personal',
                                options: [
                                  SubscriptionOption(
                                    title: 'Annual',
                                    price: '\$3.99/mo (\$47.99)',
                                    discount: '-40%',
                                    isSelected: selectedOptionIndices[0] == 0,
                                    onTap: () => cubit.onOptionSelected(0),
                                  ),
                                  SubscriptionOption(
                                    title: 'Monthly',
                                    price: '\$6.99/mo',
                                    isSelected: selectedOptionIndices[0] == 1,
                                    onTap: () => cubit.onOptionSelected(1),
                                  ),
                                ],
                              ),
                              SubscriptionContent(
                                title: 'Workspace',
                                options: [
                                  SubscriptionOption(
                                    title: 'Team Plan',
                                    price: '\$9.99/mo',
                                    discount: '-20%',
                                    isSelected: selectedOptionIndices[1] == 0,
                                    onTap: () => cubit.onOptionSelected(0),
                                  ),
                                  SubscriptionOption(
                                    title: 'Enterprise',
                                    price: '\$29.99/mo',
                                    isSelected: selectedOptionIndices[1] == 1,
                                    onTap: () => cubit.onOptionSelected(1),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MainScreen(
                                  initialIndex: 1,
                                  targetPage: OrdersScreen(),
                                ),
                              ),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: 24.w,
                            ),
                            width: double.infinity,
                            height: 54.h,
                            decoration: BoxDecoration(
                              color: AppColors.kPrimaryPurble,
                              borderRadius: BorderRadius.circular(
                                18.r,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'Start 7-day trial',
                                style: GoogleFonts.ibmPlexSans(
                                  // Updated to IBM Plex Sans
                                  fontSize: 19.sp,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Restore purchase',
                              style: GoogleFonts.ibmPlexSans(
                                // Updated to IBM Plex Sans
                                fontWeight: FontWeight.w400,
                                color: AppColors.kPrimaryGrey,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 2.h),
                              child: Text(
                                ' • ',
                                style: GoogleFonts.ibmPlexSans(
                                  // Updated to IBM Plex Sans
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.kPrimaryGrey,
                                ),
                              ),
                            ),
                            Text(
                              'Terms',
                              style: GoogleFonts.ibmPlexSans(
                                // Updated to IBM Plex Sans
                                fontWeight: FontWeight.w400,
                                color: AppColors.kPrimaryGrey,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 2.h),
                              child: Text(
                                ' • ',
                                style: GoogleFonts.ibmPlexSans(
                                  // Updated to IBM Plex Sans
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.kPrimaryGrey,
                                ),
                              ),
                            ),
                            Text(
                              'Privacy policy',
                              style: GoogleFonts.ibmPlexSans(
                                // Updated to IBM Plex Sans
                                fontWeight: FontWeight.w400,
                                color: AppColors.kPrimaryGrey,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 9.h,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
