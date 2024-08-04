import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart'; // Import Google Fonts package
import 'package:lines_co_test/core/utils/colors.dart';

class SubscriptionContent extends StatelessWidget {
  final String title;
  final List<SubscriptionOption> options;

  const SubscriptionContent({
    required this.title,
    required this.options,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          SizedBox(height: 20.h),
          ...options,
        ],
      ),
    );
  }
}

class SubscriptionOption extends StatelessWidget {
  final String title;
  final String price;
  final String? discount;
  final bool isSelected;
  final VoidCallback onTap;

  const SubscriptionOption({
    required this.title,
    required this.price,
    this.discount,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 16.h,
        ),
        margin: EdgeInsets.only(
          bottom: 12.h,
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.kPrimaryPurble.withOpacity(0.8)
              : AppColors.kPrimaryPurble.withOpacity(0.2),
          borderRadius: BorderRadius.circular(18.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      isSelected ? Icons.check_circle : Icons.circle_outlined,
                      color: isSelected ? Colors.white : Colors.grey,
                      size: 24.sp,
                    ),
                    SizedBox(width: 6.w),
                    Text(
                      title,
                      style: GoogleFonts.ibmPlexSans(
                        // Updated to IBM Plex Sans
                        fontSize: 19.sp,
                        color: isSelected ? Colors.white : Colors.black,
                      ),
                    ),
                  ],
                ),
                Text(
                  price,
                  style: GoogleFonts.ibmPlexSans(
                    // Updated to IBM Plex Sans
                    fontSize: 15.sp,
                    color: isSelected ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
            if (discount != null)
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 8.w),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Text(
                    discount!,
                    style: GoogleFonts.ibmPlexSans(
                      // Updated to IBM Plex Sans
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
