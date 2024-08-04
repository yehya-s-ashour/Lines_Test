import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lines_co_test/core/cubit/products/products_cubit.dart';
import 'package:lines_co_test/core/cubit/products/products_states.dart';
import 'package:lines_co_test/core/shared/widgets/stars_rating_widget.dart';
import 'package:lines_co_test/core/utils/colors.dart';
import 'package:lines_co_test/screens/product_screen/widgets/details_section_widget.dart';
import 'package:lines_co_test/screens/product_screen/widgets/product_details_bottom_sheet.dart';
import 'package:lines_co_test/screens/product_screen/widgets/specification_bottom_sheet.dart';
import 'package:lines_co_test/core/models/product_model.dart';

Widget productDetailsWidget(BuildContext context, Product product) {
  final productCubit = BlocProvider.of<ProductCubit>(context);
  return BlocBuilder<ProductCubit, ProductState>(
    builder: (context, state) {
      if (state is ProductLoading) {
        return Center(
          child: SpinKitDoubleBounce(
            color: AppColors.kPrimaryBlue,
          ),
        );
      } else if (state is ProductLoaded) {
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
              Text(
                '${product.price} SAR',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                product.name,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
              ),
              SizedBox(
                height: 8.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 16.h,
                    child: StarsRating(
                      rating: product.rating,
                    ),
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Text(
                    '${product.rating}',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: AppColors.kPrimaryYellow,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Text(
                    '${product.reviews.count} Reviews',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                ],
              ),
              SizedBox(
                height: 8.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'Orders: ',
                      style: Theme.of(context).textTheme.bodyMedium,
                      children: [
                        TextSpan(
                          text: '${product.orders}',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 0.8.w,
                    height: 13.5.h,
                    margin: EdgeInsets.only(
                      left: 8.w,
                      right: 8.w,
                    ),
                    color: AppColors.kPrimaryGrey,
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Available Quantity: ',
                      style: Theme.of(context).textTheme.bodyMedium,
                      children: [
                        TextSpan(
                          text: '${product.availableQuantity}',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              detailsSectionWidget(
                context: context,
                title: 'Select Specifications And Quantity',
                isLast: false,
                onTap: () {
                  showSpecificationsBottomSheet(
                    context,
                  );
                },
              ),
              detailsSectionWidget(
                context: context,
                title: 'Product Details',
                isLast: false,
                onTap: () {
                  showProductDetailsBottomSheet(context);
                },
              ),
              detailsSectionWidget(
                context: context,
                title: 'Return Policy',
                isLast: true,
                onTap: () {},
              ),
            ],
          ),
        );
      } else if (state is ProductError) {
        return Center(child: Text('Something Went Wrong'));
      } else {
        return SizedBox.shrink();
      }
    },
  );
}
