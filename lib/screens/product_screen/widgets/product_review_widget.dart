import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lines_co_test/core/models/product_model.dart';
import 'package:lines_co_test/core/shared/widgets/stars_rating_widget.dart';
import 'package:lines_co_test/core/utils/colors.dart';

Widget productReviewWidget(context, Product product) {
  return Padding(
    padding: EdgeInsets.only(
      left: 16.w,
      right: 16.w,
      bottom: 16.h,
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Reviews (${product.reviews.count})',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
            ),
            Text(
              'Add Review',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w500,
                    color: const Color(0xffCED4DA),
                  ),
            ),
          ],
        ),
        Container(
          width: 343.w,
          margin: EdgeInsets.only(top: 8.h),
          padding: EdgeInsets.only(
            top: 16.h,
            bottom: 16.h,
            left: 16.h,
            right: 16.h,
          ),
          decoration: BoxDecoration(
            color: Color(0xFFFAFAFA),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildRatingText(
                    context: context,
                    title: 'Client Reviews',
                    isFirst: true,
                    isLast: false,
                  ),
                  buildRatingText(
                    context: context,
                    title: 'Product',
                    isFirst: false,
                    isLast: false,
                  ),
                  buildRatingText(
                    context: context,
                    title: 'Seller',
                    isFirst: false,
                    isLast: false,
                  ),
                  buildRatingText(
                    context: context,
                    title: 'Delivery',
                    isFirst: false,
                    isLast: true,
                  ),
                ],
              ),
              SizedBox(width: 8.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildRatingStars(
                    context: context,
                    rating: 5,
                    isLast: false,
                    isFirst: true,
                  ),
                  buildRatingStars(
                    context: context,
                    rating: product.reviews.productReviews['total'],
                    isFirst: false,
                    isLast: false,
                  ),
                  buildRatingStars(
                    context: context,
                    rating: product.reviews.sellerReviews['total'],
                    isFirst: false,
                    isLast: false,
                  ),
                  buildRatingStars(
                    context: context,
                    rating: product.reviews.deliveryReviews['total'],
                    isFirst: false,
                    isLast: true,
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 16.h,
        ),
        Center(
          child: Text(
            'You must log in first to add a review',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        SizedBox(
          height: 16.h,
        ),
        const Divider(
          color: AppColors.kPrimaryLightGrey,
        )
      ],
    ),
  );
}

Widget buildRatingText({
  required BuildContext context,
  required String title,
  required bool isFirst,
  required bool isLast,
}) {
  return Padding(
    padding: EdgeInsets.only(bottom: isLast ? 0 : 6.5.h),
    child: Text(
      title,
      style: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontWeight: isFirst ? FontWeight.w500 : FontWeight.w400,
            color: isFirst ? Colors.black : AppColors.kPrimaryGrey,
          ),
    ),
  );
}

Widget buildRatingStars({
  required BuildContext context,
  required double rating,
  required bool isFirst,
  required bool isLast,
}) {
  return Padding(
    padding: EdgeInsets.only(bottom: isLast ? 0 : 6.5.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 16.h,
          child: StarsRating(
            rating: rating,
          ),
        ),
        SizedBox(width: 4.w),
        Text(
          '$rating',
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.w500,
                color: AppColors.kPrimaryYellow,
              ),
        ),
      ],
    ),
  );
}
