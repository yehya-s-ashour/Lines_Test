import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lines_co_test/core/cubit/products/products_cubit.dart';
import 'package:lines_co_test/core/cubit/products/products_states.dart';
import 'package:lines_co_test/core/models/product_model.dart';
import 'package:lines_co_test/core/utils/colors.dart';
import 'package:lines_co_test/screens/product_screen/widgets/custom_product_screen_appbar.dart';
import 'package:lines_co_test/screens/product_screen/widgets/product_details_widget.dart';
import 'package:lines_co_test/screens/product_screen/widgets/product_image_card.dart';
import 'package:lines_co_test/screens/product_screen/widgets/product_review_widget.dart';
import 'package:lines_co_test/screens/product_screen/widgets/specification_bottom_sheet.dart';
import 'package:lines_co_test/screens/product_screen/widgets/store_details_widget.dart';
import 'package:lines_co_test/screens/product_screen/widgets/suggested_products_widget.dart';

class ProductScreen extends StatelessWidget {
  final Product? product;

  ProductScreen({super.key, this.product});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Theme.of(context).scaffoldBackgroundColor,
      ),
    );
    return BlocProvider(
      create: (context) => ProductCubit()..loadProducts(),
      child: SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(56.0),
            child: CustomProductScreenAppBar(
              context,
              product == null ? true : false,
            ),
          ),
          body: BlocBuilder<ProductCubit, ProductState>(
            builder: (context, state) {
              if (state is ProductLoading) {
                return Center(
                  child: SpinKitDoubleBounce(
                    color: AppColors.kPrimaryBlue,
                  ),
                );
              } else if (state is ProductLoaded) {
                // Use the provided product or fall back to the first product in the list
                final selectedProduct = product ?? state.products.first;

                return Stack(
                  children: [
                    SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          storeDetailsWidget(context, selectedProduct),
                          productImageCard(selectedProduct),
                          productDetailsWidget(context, selectedProduct),
                          productReviewWidget(context, selectedProduct),
                          SuggestedProductsWidget(context, selectedProduct),
                          SizedBox(
                            height: 85.h,
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 34.h,
                      left: 16.w,
                      right: 16.w,
                      child: InkWell(
                        onTap: () {
                          showSpecificationsBottomSheet(
                            context,
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          height: 48.h,
                          decoration: BoxDecoration(
                            color: AppColors.kPrimaryLightBlue,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Center(
                            child: Text(
                              'Add to Cart',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    color: Colors.white,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              } else if (state is ProductError) {
                return Center(child: Text('Something Went Wrong'));
              } else {
                return SizedBox.shrink(); // Or some fallback UI
              }
            },
          ),
        ),
      ),
    );
  }
}
