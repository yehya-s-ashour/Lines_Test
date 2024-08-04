import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lines_co_test/core/models/product_model.dart';

Widget storeDetailsWidget(context, Product product) {
  return Padding(
    padding: EdgeInsets.only(
      top: 16.0.h,
      left: 16.w,
      right: 16.w,
      bottom: 16.h,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.transparent,
              child: Image.asset(
                '${product.store.imageUrl}',
              ),
            ),
            SizedBox(
              width: 8.w,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      '${product.store.name}',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    Image.asset(
                      'assets/icons/crown_icon.png',
                      width: 16.w,
                      height: 16.h,
                    )
                  ],
                ),
                Text(
                  'Fashion and style | Dammam',
                  style: Theme.of(context).textTheme.titleMedium,
                )
              ],
            ),
          ],
        ),
        SizedBox(
          height: 24.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/icons/profile_add_icon.png',
                width: 24.w,
                height: 24.w,
              ),
              SizedBox(
                width: 8.w,
              ),
              Image.asset(
                'assets/icons/message_icon.png',
                width: 24.w,
                height: 24.w,
              ),
            ],
          ),
        )
      ],
    ),
  );
}
