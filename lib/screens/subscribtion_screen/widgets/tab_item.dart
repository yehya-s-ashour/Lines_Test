import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart'; // Import Google Fonts package
import 'package:lines_co_test/core/utils/colors.dart';

class TabItem extends StatelessWidget {
  final bool isSelected;
  final String label;
  final String iconUrl;
  final int flex;
  final VoidCallback onTap;

  const TabItem({
    required this.isSelected,
    required this.label,
    required this.iconUrl,
    required this.onTap,
    required this.flex,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: flex,
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(0.r),
                  child: Image.asset(
                    iconUrl,
                    width: 22.w,
                    height: 22.h,
                  ),
                ),
                SizedBox(width: 8.h),
                Expanded(
                  flex: flex,
                  child: Text(
                    label,
                    style: GoogleFonts.ibmPlexSans(
                      // Updated to IBM Plex Sans
                      fontSize: 19.sp,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.h),
            Row(
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: 2.h,
                    color:
                        isSelected ? Colors.black : AppColors.kPrimaryLightGrey,
                  ),
                ),
                Container(
                  width: 30.w,
                  height: 2.h,
                  color: AppColors.kPrimaryLightGrey,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
