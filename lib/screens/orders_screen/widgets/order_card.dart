import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart'; // Import Google Fonts package
import 'package:lines_co_test/core/models/order_model.dart';
import 'package:lines_co_test/core/models/product_model.dart';
import 'package:lines_co_test/core/utils/colors.dart';
import 'package:lines_co_test/screens/product_screen/product_screen.dart';

Widget OrderCard(BuildContext context, Order order) {
  return Container(
    width: double.infinity.w,
    margin: EdgeInsets.only(bottom: 16.h, left: 16.w, right: 16.w),
    decoration: BoxDecoration(
      color: Color(0xffFBFBFB),
      borderRadius: BorderRadius.circular(10.r),
    ),
    child: Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: 16.0.w,
            right: 16.0.w,
            top: 16.0.h,
            bottom: 16.0.h,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${order.passengerCount} Passengers',
                style: GoogleFonts.poppins(
                  // Use Poppins font
                  textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                ),
              ),
              SizedBox(
                height: 14.h,
              ),
              buildTextIcon(
                context: context,
                text: 'Departure Address',
                span: order.departureAddress,
                isIconed: false,
                isMultiLine: false,
              ),
              SizedBox(
                height: 10.h,
              ),
              buildTextIcon(
                context: context,
                text: 'Arrival Address & Time',
                span: '${order.arrivalAddress}\n${order.arrivalTime}',
                isIconed: true,
                icon: 'assets/icons/track_icon.png',
                isMultiLine: true,
              ),
              SizedBox(
                height: 10.h,
              ),
              buildRichTextIcon(
                context: context,
                text: 'Days: ',
                span: order.days,
                spanSpan: '(Except Friday & Saturday)',
              ),
              SizedBox(
                height: 24.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: buildButton(
                      context: context,
                      isFilled: true,
                      fillColor: AppColors.kPrimaryBlue,
                      title: 'Details',
                      fontColor: Colors.white,
                      borderColor: AppColors.kPrimaryBlue,
                      height: 38,
                      onTap: order.isRefunded
                          ? () {}
                          : () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return ProductScreen(
                                    product: Product(
                                      id: '1',
                                      name: 'Air Jordan',
                                      price: 75.0,
                                      rating: 4.5,
                                      description:
                                          'High quality Air Jordan shoes.',
                                      orders: 17,
                                      availableQuantity: 10,
                                      imageUrl: 'assets/images/shoes_1.png',
                                      store: Store(
                                        id: '0',
                                        name: 'Air',
                                        imageUrl: 'assets/icons/nike_logo.png',
                                      ),
                                      reviews: Reviews(
                                        count: 9,
                                        productReviews: {
                                          'total': 3.1,
                                          'reviews': [
                                            '',
                                            '',
                                            '',
                                          ]
                                        },
                                        sellerReviews: {
                                          'total': 4.2,
                                          'reviews': [
                                            '',
                                            '',
                                            '',
                                          ]
                                        },
                                        deliveryReviews: {
                                          'total': 2.3,
                                          'reviews': [
                                            '',
                                            '',
                                            '',
                                          ]
                                        },
                                      ),
                                      isFavorite: false,
                                    ),
                                  );
                                },
                              ));
                            },
                    ),
                  ),
                  SizedBox(width: 8.w),
                  order.isRefunded
                      ? Expanded(
                          child: buildButton(
                            context: context,
                            isFilled: false,
                            title: 'Refund Requests',
                            fontColor: Color(0xffF44336),
                            borderColor: Color(0xffF44336),
                            height: 38,
                            onTap: () {},
                          ),
                        )
                      : SizedBox(),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: buildButton(
                      context: context,
                      isFilled: false,
                      title: 'Notice',
                      fontColor: AppColors.kPrimaryBlue,
                      borderColor: AppColors.kPrimaryBlue,
                      height: 38,
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          right: 0,
          top: 0,
          child: Container(
            height: 38.h,
            padding: EdgeInsets.symmetric(
              horizontal: 10.w,
            ),
            decoration: BoxDecoration(
              color: AppColors.kPrimaryOrange.withOpacity(0.05),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10.r),
                topRight: Radius.circular(10.r),
              ),
            ),
            child: Center(
              child: Text(
                order.organization,
                style: GoogleFonts.poppins(
                  // Use Poppins font
                  textStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.kPrimaryOrange,
                      ),
                ),
              ),
            ),
          ),
        ),
      ],
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
