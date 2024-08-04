import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart'; // Import Google Fonts package
import 'package:lines_co_test/core/utils/colors.dart';

Widget CustomTransportAppBar(BuildContext context) {
  return Container(
    color: AppColors.kPrimaryBlue,
    height: 56.h,
    width: double.infinity.w,
    padding: EdgeInsets.symmetric(
      horizontal: 16.w,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 24.w,
              height: 24.h,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Icon(
                Icons.add,
                color: Colors.transparent,
                size: 9.sp,
              ),
            ),
            SizedBox(
              width: 6.w,
            ),
            Text(
              'New Package',
              style: GoogleFonts.poppins(
                // Use Poppins font
                textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Colors.transparent,
                    ),
              ),
            ),
          ],
        ),
        Text(
          'LOGO',
          style: GoogleFonts.poppins(
            // Use Poppins font
            textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 24.w,
              height: 24.h,
              decoration: BoxDecoration(
                color: Color(0xffFAFAFA),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Center(
                child: Icon(
                  Icons.add,
                  size: 16.sp,
                  color: AppColors.kPrimaryOrange,
                ),
              ),
            ),
            SizedBox(
              width: 6.w,
            ),
            Text(
              'New Package',
              style: GoogleFonts.poppins(
                // Use Poppins font
                textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
              ),
            ),
          ],
        )
      ],
    ),
  );
}
