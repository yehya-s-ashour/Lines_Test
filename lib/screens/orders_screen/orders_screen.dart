import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart'; // Import Google Fonts package
import 'package:lines_co_test/core/cubit/orders/orders_cubit.dart';
import 'package:lines_co_test/core/cubit/orders/orders_states.dart';
import 'package:lines_co_test/screens/orders_screen/widgets/order_card.dart';
import 'package:lines_co_test/core/utils/colors.dart';
import 'package:flutter/services.dart';

class OrdersScreen extends StatelessWidget {
  OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Set status bar color to match the app bar color
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: AppColors.kPrimaryBlue,
    ));

    return BlocProvider(
      create: (context) => OrderCubit()..loadOrders(),
      child: BlocBuilder<OrderCubit, OrderState>(
        builder: (context, state) {
          if (state is OrderLoading) {
            return Center(
              child: SpinKitDoubleBounce(
                color: AppColors.kPrimaryBlue,
              ),
            );
          } else if (state is OrderLoaded) {
            final cubit = context.read<OrderCubit>();
            final organizations = state.orders
                .map((order) => order.organization)
                .toSet()
                .toList();

            return SafeArea(
              child: Scaffold(
                appBar: PreferredSize(
                  preferredSize: Size.fromHeight(56.0),
                  child: CustomOrdersAppBar(context),
                ),
                body: SingleChildScrollView(
                  padding: EdgeInsets.zero,
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 12.h,
                      ),
                      SizedBox(
                        height: 20.h,
                        child: ListView.separated(
                          itemCount: 4,
                          shrinkWrap: true,
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                          ),
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              width: 12.w,
                            );
                          },
                          itemBuilder: (BuildContext context, int index) {
                            return Text(
                              [
                                'Waiting Confirmation',
                                'In Progress',
                                'Completed',
                                'Canceled'
                              ][index],
                              style: GoogleFonts.poppins(
                                // Use Poppins font
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: index == 1
                                          ? AppColors.kPrimaryBlue
                                          : AppColors.kPrimaryDarkGrey,
                                    ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      SizedBox(
                        height: 38.h,
                        child: ListView.separated(
                          itemCount: organizations.length,
                          shrinkWrap: true,
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                          ),
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              width: 8.w,
                            );
                          },
                          itemBuilder: (BuildContext context, int index) {
                            final organization = organizations[index];
                            return buildButton(
                              context: context,
                              height: 38.h,
                              isFilled:
                                  organization == state.selectedOrganization,
                              fillColor: AppColors.kPrimaryOrange,
                              borderColor: AppColors.kPrimaryOrange,
                              title: organization,
                              fontColor:
                                  organization == state.selectedOrganization
                                      ? Colors.white
                                      : AppColors.kPrimaryOrange,
                              onTap: () {
                                cubit.toggleOrganization(organization);
                              },
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      ...cubit.filteredOrders
                          .map((order) => OrderCard(context, order))
                          .toList(),
                    ],
                  ),
                ),
              ),
            );
          } else if (state is OrderError) {
            return Center(child: Text(state.error));
          }
          return Container();
        },
      ),
    );
  }
}

Widget CustomOrdersAppBar(BuildContext context) {
  return Container(
    color: AppColors.kPrimaryBlue,
    height: 56.h,
    width: double.infinity.w,
    child: Center(
      child: Text(
        'Orders',
        style: GoogleFonts.poppins(
          // Use Poppins font
          textStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Colors.white,
              ),
        ),
      ),
    ),
  );
}

Widget buildButton({
  required BuildContext context,
  required double height,
  required bool isFilled,
  Color? fillColor,
  required Color borderColor,
  required String title,
  required Color fontColor,
  required VoidCallback onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: height.h,
      padding: EdgeInsets.symmetric(
        horizontal: 10.w,
      ),
      decoration: BoxDecoration(
        color: isFilled ? fillColor : null,
        borderRadius: BorderRadius.circular(5.r),
        border: Border.all(color: borderColor),
      ),
      child: Center(
        child: Text(
          '$title',
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            // Use Poppins font
            textStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: fontColor,
                ),
          ),
        ),
      ),
    ),
  );
}

Widget buildTextIcon({
  required BuildContext context,
  required String text,
  required String span,
  String? icon,
  required bool isIconed,
  required bool isMultiLine,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$text',
              style: GoogleFonts.poppins(
                // Use Poppins font
                textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.kPrimaryLightBlue,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            SizedBox(
              width: 195.w,
              child: Text(
                '$span',
                style: GoogleFonts.poppins(
                  // Use Poppins font
                  textStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.black,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
      if (isIconed)
        Row(
          children: [
            Image.asset(
              icon!,
              width: 16.w,
              height: 16.w,
            ),
            SizedBox(
              width: 12.w,
            ),
          ],
        ),
    ],
  );
}

Widget buildRichTextIcon({
  required BuildContext context,
  required String text,
  required String span,
  required String spanSpan,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: RichText(
          overflow: TextOverflow.ellipsis,
          text: TextSpan(
            text: text,
            style: GoogleFonts.poppins(
              // Use Poppins font
              textStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.kPrimaryLightBlue,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            children: [
              TextSpan(
                text: '$span ',
                style: GoogleFonts.poppins(
                  // Use Poppins font
                  textStyle: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              TextSpan(
                text: spanSpan,
                style: GoogleFonts.poppins(
                  // Use Poppins font
                  textStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: AppColors.kPrimaryDarkGrey,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
