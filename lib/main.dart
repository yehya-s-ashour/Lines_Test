import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lines_co_test/core/cubit/orders/orders_cubit.dart';
import 'package:lines_co_test/core/cubit/packages/packages_cubit.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lines_co_test/core/cubit/products/products_cubit.dart';
import 'package:lines_co_test/core/cubit/subscribtion/subs_cubit.dart';
import 'package:lines_co_test/core/utils/styles.dart';
import 'package:lines_co_test/screens/product_screen/product_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => ProductCubit(),
            ),
            BlocProvider(
              create: (context) => PackageCubit(),
            ),
            BlocProvider(
              create: (context) => OrderCubit(),
            ),
            BlocProvider(
              create: (context) => SubscriptionCubit(),
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTextStyles.lightTheme,
            home: ProductScreen(),
          ),
        );
      },
    );
  }
}
