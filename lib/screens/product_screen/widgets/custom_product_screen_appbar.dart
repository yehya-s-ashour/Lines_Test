import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lines_co_test/core/utils/colors.dart';

Widget CustomProductScreenAppBar(BuildContext context, bool IsFirstProduct) {
  return Container(
    decoration: BoxDecoration(
      color: Theme.of(context).scaffoldBackgroundColor,
      border: Border.all(color: AppColors.kPrimaryLightGrey),
    ),
    height: 56.h,
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: IsFirstProduct
                    ? () {}
                    : () {
                        Navigator.pop(context);
                      },
                child: Image.asset(
                  'assets/icons/arrow_left.png',
                  width: 24.w,
                  height: 24.h,
                ),
              ),
              SizedBox(
                width: 17.w,
              ),
              Text(
                'Page',
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ],
          ),
          Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 3.0.w),
                child: Image.asset(
                  'assets/icons/shopping_cart.png',
                  width: 24.w,
                  height: 24.h,
                ),
              ),
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  width: 10.w,
                  height: 10.w,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffEF476F),
                      border: Border.all(
                        color: Colors.white,
                        width: 1.w,
                      )),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
