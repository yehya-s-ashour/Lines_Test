import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lines_co_test/core/shared/widgets/custom_radio.dart';
import 'package:lines_co_test/core/utils/colors.dart';
import 'package:lines_co_test/core/cubit/products/products_cubit.dart';
import 'package:lines_co_test/core/cubit/products/products_states.dart';
import 'package:lines_co_test/screens/product_screen/widgets/product_details_bottom_sheet.dart';

void showSpecificationsBottomSheet(
  BuildContext context,
) {
  final productCubit = BlocProvider.of<ProductCubit>(context);

  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
    ),
    builder: (BuildContext context) {
      return BottomSheetContent(cubit: productCubit);
    },
  );
}

class BottomSheetContent extends StatelessWidget {
  final ProductCubit cubit;

  BottomSheetContent({required this.cubit});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      bloc: cubit,
      builder: (context, state) {
        if (state is ProductLoaded) {
          return SizedBox(
            height: 435.h,
            child: Padding(
              padding: EdgeInsets.only(
                left: 16.w,
                right: 16.w,
              ),
              child: SingleChildScrollView(
                padding: EdgeInsets.zero,
                physics: BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 24.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Select Specifications And Quantity',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                            showProductDetailsBottomSheet(context);
                          },
                          child: Padding(
                            padding: EdgeInsets.only(right: 2.0.w),
                            child: Image.asset(
                              'assets/icons/close_icon.png',
                              width: 14.w,
                              height: 14.h,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Text(
                      'Quantity',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                    ),
                    Container(
                      width: double.infinity.w,
                      height: 40.h,
                      margin: EdgeInsets.only(
                        top: 8.h,
                        bottom: 16.h,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(4.r),
                        border: Border.all(
                          color: AppColors.kPrimaryLightGrey,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 2,
                            child: InkWell(
                              onTap: state.quantity == 1
                                  ? null
                                  : () {
                                      cubit.setQuantity(state.quantity - 1);
                                    },
                              child: Container(
                                height: 40.h,
                                margin: EdgeInsets.only(
                                  right: 35.w,
                                ),
                                width: double.infinity,
                                child: Center(
                                  child: Icon(
                                    Icons.remove,
                                    color: state.quantity == 1
                                        ? AppColors.kPrimaryLightGrey
                                        : Colors.black,
                                    size: 24.sp,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Center(
                              child: Text(
                                '${state.quantity}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: InkWell(
                              onTap: () {
                                cubit.setQuantity(state.quantity + 1);
                              },
                              child: Container(
                                margin: EdgeInsets.only(
                                  left: 35.w,
                                ),
                                height: 40.h,
                                width: double.infinity,
                                child: Center(
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.black,
                                    size: 24.sp,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'Size',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                    ),
                    Row(
                      children: [
                        buildToggleItem(
                            context,
                            'Small',
                            'Small',
                            state.size == 'Small',
                            () => cubit.setSize('Small')),
                        buildToggleItem(
                          context,
                          'Medium',
                          'Medium',
                          state.size == 'Medium',
                          () => cubit.setSize('Medium'),
                        ),
                        buildToggleItem(
                          context,
                          'Large',
                          'Large',
                          state.size == 'Large',
                          () => cubit.setSize('Large'),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Text(
                      'Select The Dough',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Column(
                      children: [
                        CustomRadio(
                          value: 1,
                          groupValue: state.doughType,
                          onChanged: (value) {
                            cubit.setDoughType(value!);
                          },
                          title: 'The Original Dough',
                          isAddingCost: false,
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        CustomRadio(
                          value: 2,
                          groupValue: state.doughType,
                          onChanged: (value) {
                            cubit.setDoughType(value!);
                          },
                          title: 'Thin Crispy',
                          isAddingCost: true,
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        CustomRadio(
                          value: 3,
                          groupValue: state.doughType,
                          onChanged: (value) {
                            cubit.setDoughType(value!);
                          },
                          title: 'Crispy',
                          isAddingCost: true,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Text(
                      'Sauce Type',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Column(
                      children: [
                        CustomRadio(
                          value: 1,
                          groupValue: state.sauceType,
                          onChanged: (value) {
                            cubit.setSauceType(value!);
                          },
                          title: 'Barbecue Sauce',
                          isAddingCost: true,
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        CustomRadio(
                          value: 2,
                          groupValue: state.sauceType,
                          onChanged: (value) {
                            cubit.setSauceType(value!);
                          },
                          title: 'Pizza Sauce',
                          isAddingCost: true,
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        CustomRadio(
                          value: 3,
                          groupValue: state.sauceType,
                          onChanged: (value) {
                            cubit.setSauceType(value!);
                          },
                          title: 'Ranch Sauce',
                          isAddingCost: true,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Text(
                      'Additional Choices',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Column(
                      children: [
                        buildCheckBox(
                          context: context,
                          isChecked:
                              state.additionalChoices.contains('Extra Cheese'),
                          onTap: () =>
                              state.additionalChoices.contains('Extra Cheese')
                                  ? cubit.removeAdditionalChoice('Extra Cheese')
                                  : cubit.addAdditionalChoice('Extra Cheese'),
                          title: 'Extra Cheese',
                          isAddingCost: true,
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        buildCheckBox(
                          context: context,
                          isChecked:
                              state.additionalChoices.contains('Sausage'),
                          onTap: () =>
                              state.additionalChoices.contains('Sausage')
                                  ? cubit.removeAdditionalChoice('Sausage')
                                  : cubit.addAdditionalChoice('Sausage'),
                          title: 'Sausage',
                          isAddingCost: true,
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        buildCheckBox(
                          context: context,
                          isChecked:
                              state.additionalChoices.contains('Garlic Bread'),
                          onTap: () =>
                              state.additionalChoices.contains('Garlic Bread')
                                  ? cubit.removeAdditionalChoice('Garlic Bread')
                                  : cubit.addAdditionalChoice('Garlic Bread'),
                          title: 'Garlic Bread',
                          isAddingCost: true,
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        buildCheckBox(
                          context: context,
                          isChecked:
                              state.additionalChoices.contains('Ketchup'),
                          onTap: () =>
                              state.additionalChoices.contains('Ketchup')
                                  ? cubit.removeAdditionalChoice('Ketchup')
                                  : cubit.addAdditionalChoice('Ketchup'),
                          title: 'Ketchup',
                          isAddingCost: false,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Text(
                      'Remove From Pizza',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Column(
                      children: [
                        buildCheckBox(
                          context: context,
                          isChecked: state.removeFromPizza.contains('Tomato'),
                          onTap: () => state.removeFromPizza.contains('Tomato')
                              ? cubit.removeRemoveFromPizza('Tomato')
                              : cubit.addRemoveFromPizza('Tomato'),
                          title: 'Tomato',
                          isAddingCost: false,
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        buildCheckBox(
                          context: context,
                          isChecked: state.removeFromPizza.contains('Sausage'),
                          onTap: () => state.removeFromPizza.contains('Sausage')
                              ? cubit.removeRemoveFromPizza('Sausage')
                              : cubit.addRemoveFromPizza('Sausage'),
                          title: 'Sausage',
                          isAddingCost: false,
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        buildCheckBox(
                          context: context,
                          isChecked:
                              state.removeFromPizza.contains('Garlic Bread'),
                          onTap: () =>
                              state.removeFromPizza.contains('Garlic Bread')
                                  ? cubit.removeRemoveFromPizza('Garlic Bread')
                                  : cubit.addRemoveFromPizza('Garlic Bread'),
                          title: 'Garlic Bread',
                          isAddingCost: false,
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        buildCheckBox(
                          context: context,
                          isChecked: state.removeFromPizza.contains('Ketchup'),
                          onTap: () => state.removeFromPizza.contains('Ketchup')
                              ? cubit.removeRemoveFromPizza('Ketchup')
                              : cubit.addRemoveFromPizza('Ketchup'),
                          title: 'Ketchup',
                          isAddingCost: false,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 28.h,
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return Center(
            child: SpinKitDoubleBounce(
              color: AppColors.kPrimaryBlue,
            ),
          );
        }
      },
    );
  }

  buildToggleItem(context, String title, String value, bool isSelected,
      VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 32.h,
        margin: EdgeInsets.only(
          right: 8.w,
          top: 8.h,
        ),
        padding: EdgeInsets.only(
          right: 10.w,
          left: 10.w,
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.kPrimaryLightBlue
              : Color(0xffD8D8D8).withOpacity(0.3),
          borderRadius: BorderRadius.circular(6.r),
        ),
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: isSelected ? Colors.white : Colors.black,
                ),
          ),
        ),
      ),
    );
  }

  buildCheckBox({
    required BuildContext context,
    required bool isChecked,
    required VoidCallback onTap,
    required String title,
    required bool isAddingCost,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            width: 20.w,
            height: 20.h,
            decoration: BoxDecoration(
              color:
                  isChecked ? AppColors.kPrimaryLightBlue : Colors.transparent,
              borderRadius: BorderRadius.circular(5.r),
              border: Border.all(
                color:
                    isChecked ? AppColors.kPrimaryLightBlue : Color(0xff807979),
              ),
            ),
            child: isChecked
                ? Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 18.sp,
                  )
                : null,
          ),
          SizedBox(
            width: 10.w,
          ),
          Text(
            '$title',
            style: Theme.of(context).textTheme.bodyMedium!,
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
