import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lines_co_test/core/cubit/products/products_cubit.dart';
import 'package:lines_co_test/core/cubit/products/products_states.dart';
import 'package:lines_co_test/core/models/product_model.dart';
import 'package:lines_co_test/core/utils/colors.dart';
import 'package:lines_co_test/screens/product_screen/product_screen.dart';

Widget SuggestedProductsWidget(BuildContext context, Product selectedProduct) {
  return BlocBuilder<ProductCubit, ProductState>(
    builder: (context, state) {
      if (state is ProductLoading) {
        return Center(
          child: SpinKitDoubleBounce(
            color: AppColors.kPrimaryBlue,
          ),
        );
      } else if (state is ProductLoaded) {
        final filteredProducts = state.products
            .where((product) => product != selectedProduct)
            .toList();

        return Padding(
          padding: EdgeInsets.only(
            left: 16.0.w,
            right: 16.0.w,
            bottom: 16.0.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'You May Also Like',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
              ),
              SizedBox(height: 10.h),
              LayoutGrid(
                columnGap: 16.0.w,
                rowGap: 16.0.h,
                columnSizes: [1.fr, 1.fr],
                rowSizes: List.generate(
                    (filteredProducts.length / 2).ceil(), (_) => auto),
                children: filteredProducts
                    .map(
                      (product) => buildGridItem(
                        context,
                        product,
                        () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return ProductScreen(product: product);
                            },
                          ));
                        },
                      ),
                    )
                    .toList(),
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

Widget buildGridItem(
    BuildContext context, Product product, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 163.h,
              width: 163.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  8.r,
                ),
                color: const Color(0xffF6F6F6),
              ),
              child: Center(
                child: Image.asset(
                  product.imageUrl,
                  height: 100.h,
                ),
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              '${product.price} SAR',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
            ),
            SizedBox(
              height: 4.h,
            ),
            Text(
              product.name,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.black,
                  ),
            ),
          ],
        ),
      ),
    ),
  );
}
