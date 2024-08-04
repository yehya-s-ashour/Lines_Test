import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lines_co_test/core/utils/colors.dart';

class StarsRating extends StatelessWidget {
  final double rating;

  StarsRating({
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Stack(
          children: [
            Icon(
              Icons.star_rounded,
              color: const Color(0xFFE9E9E9),
              size: 16.sp,
            ),
            if (index < rating && index + 1 > rating)
              ClipRect(
                child: Align(
                  alignment: Alignment.topLeft,
                  widthFactor: rating - index,
                  child: Icon(
                    Icons.star_rounded,
                    color: AppColors.kPrimaryYellow,
                    size: 16.sp,
                  ),
                ),
              )
            else if (index < rating)
              Icon(
                Icons.star_rounded,
                color: AppColors.kPrimaryYellow,
                size: 16.sp,
              ),
          ],
        );
      }),
    );
  }
}
