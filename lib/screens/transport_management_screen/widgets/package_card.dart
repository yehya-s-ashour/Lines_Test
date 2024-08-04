import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart'; // Import Google Fonts package
import 'package:lines_co_test/core/cubit/packages/packages_cubit.dart';
import 'package:lines_co_test/core/models/package_model.dart';
import 'package:lines_co_test/core/utils/colors.dart';

Widget packageCard(BuildContext context, Package package, int index) {
  return Container(
    width: double.infinity.w,
    margin: EdgeInsets.only(
      bottom: 16.h,
    ),
    decoration: BoxDecoration(
      color: Color(0xffFBFBFB),
      borderRadius: BorderRadius.circular(10.r),
    ),
    child: Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: 16.0.w,
            right: 16.0.w,
            top: 16.0.h,
            bottom: 16.0.h,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                package.name,
                style: GoogleFonts.poppins(
                  // Use Poppins font
                  textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                ),
              ),
              SizedBox(
                height: 14.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: buildRichTextIcon(
                      context: context,
                      text: 'Available: ',
                      span: package.available,
                      isIconed: false,
                      isMultiLine: false,
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 28.w,
                        height: 28.h,
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: Switch(
                            activeTrackColor: Color(0xff4CAF50),
                            value: package.isActive,
                            inactiveTrackColor: AppColors.kPrimaryDarkGrey,
                            trackOutlineColor:
                                MaterialStateProperty.resolveWith(
                              (final Set<MaterialState> states) {
                                if (states.contains(MaterialState.selected)) {
                                  return null;
                                }
                                return AppColors.kPrimaryDarkGrey;
                              },
                            ),
                            thumbIcon: MaterialStateProperty.resolveWith<Icon>(
                              (Set<MaterialState> states) {
                                if (states.containsAll([
                                  MaterialState.disabled,
                                  MaterialState.selected
                                ])) {
                                  return Icon(
                                    Icons.circle,
                                    color: Color(0xffE8F5E9),
                                    size: 30.sp,
                                  );
                                }

                                if (states.contains(MaterialState.disabled)) {
                                  return Icon(
                                    Icons.circle,
                                    color: Color(0xffE8F5E9),
                                    size: 30.sp,
                                  );
                                }

                                if (states.contains(MaterialState.selected)) {
                                  return Icon(
                                    Icons.circle,
                                    color: Color(0xffE8F5E9),
                                    size: 30.sp,
                                  );
                                }

                                return Icon(
                                  Icons.circle,
                                  color: Color(0xffE8F5E9),
                                  size: 30.sp,
                                );
                              },
                            ),
                            onChanged: (bool value) {
                              context
                                  .read<PackageCubit>()
                                  .toggleActiveStatus(index);
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 12.w,
                      ),
                      Image.asset(
                        'assets/icons/edit_icon.png',
                        width: 20.w,
                        height: 20.h,
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              buildRichTextIcon(
                context: context,
                text: 'Booked: ',
                span: package.booked,
                isIconed: false,
                isMultiLine: false,
              ),
              SizedBox(
                height: 10.h,
              ),
              buildRichTextIcon(
                context: context,
                text: 'From ',
                span: package.from,
                isIconed: true,
                icon: 'assets/icons/location_icon.png',
                isMultiLine: true,
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 28.w,
                  ),
                  Expanded(
                    child: SizedBox(
                      width: 273.w,
                      child: RichText(
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                          text: 'To ',
                          style: GoogleFonts.poppins(
                            // Use Poppins font
                            textStyle:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: AppColors.kPrimaryLightBlue,
                                      fontWeight: FontWeight.w600,
                                    ),
                          ),
                          children: [
                            TextSpan(
                              text: package.to,
                              style: GoogleFonts.poppins(
                                // Use Poppins font
                                textStyle:
                                    Theme.of(context).textTheme.bodySmall,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              buildRichTextIcon(
                context: context,
                text: 'Exit Time: ',
                span: package.exitTime,
                isIconed: true,
                icon: 'assets/icons/clock_icon.png',
                isMultiLine: false,
              ),
              SizedBox(
                height: 10.h,
              ),
              buildRichTextIcon(
                context: context,
                text: 'Return Time: ',
                span: package.returnTime,
                isIconed: true,
                icon: 'assets/icons/clock_icon.png',
                isMultiLine: false,
              ),
            ],
          ),
        ),
        Positioned(
          right: 0,
          top: 0,
          child: Container(
            height: 38.h,
            padding: EdgeInsets.symmetric(
              horizontal: 10.w,
            ),
            decoration: BoxDecoration(
              color: AppColors.kPrimaryOrange.withOpacity(0.05),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10.r),
                topRight: Radius.circular(10.r),
              ),
            ),
            child: Center(
              child: Text(
                package.category,
                style: GoogleFonts.poppins(
                  // Use Poppins font
                  textStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.kPrimaryOrange,
                      ),
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget buildRichTextIcon({
  required BuildContext context,
  required String text,
  required String span,
  String? icon,
  required bool isIconed,
  required bool isMultiLine,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      if (isIconed)
        Row(
          children: [
            Image.asset(
              icon!,
              width: 16.w,
              height: 16.w,
            ),
            SizedBox(
              width: 12.w,
            ),
          ],
        ),
      Expanded(
        child: RichText(
          maxLines: isMultiLine ? 2 : 1,
          overflow: TextOverflow.ellipsis,
          text: TextSpan(
            text: text,
            style: GoogleFonts.poppins(
              // Use Poppins font
              textStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.kPrimaryLightBlue,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            children: [
              TextSpan(
                text: span,
                style: GoogleFonts.poppins(
                  // Use Poppins font
                  textStyle: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
