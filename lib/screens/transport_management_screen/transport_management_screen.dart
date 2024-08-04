import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart'; // Import Google Fonts package
import 'package:lines_co_test/core/cubit/packages/packages_cubit.dart';
import 'package:lines_co_test/core/cubit/packages/packages_states.dart';
import 'package:lines_co_test/core/models/package_model.dart';
import 'package:lines_co_test/core/utils/colors.dart';
import 'package:lines_co_test/screens/transport_management_screen/widgets/custom_transport_appbar.dart';
import 'package:lines_co_test/screens/transport_management_screen/widgets/package_card.dart';

class TransportManagementScreen extends StatelessWidget {
  const TransportManagementScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: AppColors.kPrimaryBlue,
      ),
    );
    return BlocProvider(
      create: (_) => PackageCubit()..loadPackages(),
      child: BlocBuilder<PackageCubit, PackageState>(
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(56.0),
                child: CustomTransportAppBar(context),
              ),
              body: Padding(
                padding: EdgeInsets.only(
                  left: 16.0.w,
                  right: 16.0.w,
                ),
                child: state is PackageLoading
                    ? Center(
                        child: SpinKitDoubleBounce(
                          color: AppColors.kPrimaryBlue,
                        ),
                      )
                    : state is PackageLoaded
                        ? SingleChildScrollView(
                            padding: EdgeInsets.zero,
                            physics: BouncingScrollPhysics(),
                            child: Column(children: [
                              SizedBox(
                                height: 16.h,
                              ),
                              ...state.packages.asMap().entries.map((entry) {
                                int index = entry.key;
                                Package package = entry.value;
                                return packageCard(context, package, index);
                              }).toList(),
                            ]),
                          )
                        : Center(
                            child: Text(
                              state is PackageError
                                  ? state.error
                                  : 'Unknown state',
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
              ),
            ),
          );
        },
      ),
    );
  }
}
