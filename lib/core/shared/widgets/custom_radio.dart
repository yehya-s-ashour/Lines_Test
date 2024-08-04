import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lines_co_test/core/utils/colors.dart';

class CustomRadio<T> extends StatelessWidget {
  final T value;
  final T? groupValue;
  final String title;
  final bool isAddingCost;
  final ValueChanged<T?> onChanged;

  const CustomRadio({
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.title,
    required this.isAddingCost,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSelected = value == groupValue;

    return GestureDetector(
      onTap: () {
        onChanged(value);
      },
      child: Row(
        children: [
          Container(
            width: 24.sp,
            height: 24.sp,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected
                    ? AppColors.kPrimaryLightBlue
                    : Color(0xffCED4DA),
              ),
            ),
            child: Center(
              child: isSelected
                  ? Container(
                      width: 14.w,
                      height: 14.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.kPrimaryLightBlue,
                      ),
                    )
                  : Container(
                      width: 14.w,
                      height: 14.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.transparent,
                      ),
                    ),
            ),
          ),
          SizedBox(
            width: 8.w,
          ),
          Text(
            '$title',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.black,
                ),
          ),
          SizedBox(
            width: 8.w,
          ),
          isAddingCost
              ? Text(
                  '(+3 SAR)',
                  style: Theme.of(context).textTheme.bodyMedium,
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
