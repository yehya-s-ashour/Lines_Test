import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lines_co_test/core/utils/colors.dart';

Widget detailsSectionWidget({
  required context,
  required String title,
  required bool isLast,
  required VoidCallback onTap,
}) {
  return InkWell(
    onTap: onTap,
    child: Column(
      children: [
        Divider(
          height: 1.h,
          color: AppColors.kPrimaryLightGrey,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
              ),
              Image.asset(
                'assets/icons/right_arrow.png',
                width: 16.w,
                height: 16.h,
              )
            ],
          ),
        ),
        isLast
            ? Divider(
                height: 1.h,
                color: AppColors.kPrimaryLightGrey,
              )
            : SizedBox(),
      ],
    ),
  );
}
