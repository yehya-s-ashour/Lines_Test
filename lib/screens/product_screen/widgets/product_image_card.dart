import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lines_co_test/core/cubit/products/products_cubit.dart';
import 'package:lines_co_test/core/cubit/products/products_states.dart';
import 'package:lines_co_test/core/models/product_model.dart';
import 'package:lines_co_test/core/shared/widgets/action_button_widget.dart';
import 'package:lines_co_test/core/shared/widgets/alert_dialouge.dart';
import 'package:lines_co_test/core/utils/colors.dart';
import 'package:lines_co_test/screens/main_screen/main_screen.dart';

Widget productImageCard(Product product) {
  return BlocBuilder<ProductCubit, ProductState>(
    builder: (context, state) {
      if (state is ProductLoading) {
        return Center(
          child: SpinKitDoubleBounce(
            color: AppColors.kPrimaryBlue,
          ),
        );
      } else if (state is ProductLoaded) {
        final currentProduct =
            state.products.firstWhere((p) => p.id == product.id);
        return Stack(
          children: [
            Container(
              width: double.infinity.w,
              height: 270.h,
              margin: EdgeInsets.only(
                left: 16.w,
                right: 16.w,
                bottom: 16.h,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: const Color(0xffF6F6F6),
              ),
              child: Center(
                child: Image.asset(
                  currentProduct.imageUrl,
                  width: 250.w,
                  height: 141.3.h,
                ),
              ),
            ),
            Positioned(
              right: 32.w,
              top: (270.h - 168.h) / 2,
              child: SizedBox(
                height: 168.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    actionButtonWidget(
                      currentProduct.isFavorite
                          ? 'assets/icons/heart_filled_icon.png'
                          : 'assets/icons/heart_icon.png',
                      () {
                        context
                            .read<ProductCubit>()
                            .toggleFavorite(currentProduct.id);
                        showAlert(
                          context,
                          message: product.isFavorite
                              ? 'Remomved from favourites'
                              : 'Added to favourites',
                          color: AppColors.kPrimaryBlue.withOpacity(0.7),
                        );
                      },
                    ),
                    actionButtonWidget('assets/icons/repeat_icon.png', () {}),
                    actionButtonWidget('assets/icons/share_icon.png', () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return MainScreen();
                        },
                      ));
                    }),
                    actionButtonWidget('assets/icons/report_icon.png', () {}),
                  ],
                ),
              ),
            ),
          ],
        );
      } else if (state is ProductError) {
        return Center(child: Text('Something Went Wrong'));
      } else {
        return SizedBox.shrink();
      }
    },
  );
}
