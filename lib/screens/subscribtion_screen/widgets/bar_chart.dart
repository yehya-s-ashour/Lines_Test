import 'dart:ui';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart'; // Import Google Fonts package
import 'package:lines_co_test/core/utils/colors.dart';

class BarChartSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomPaint(
          size: Size(double.infinity, double.infinity),
          painter: DashedBorderPainter(
            color: Colors.black,
            strokeWidth: 1,
            dashWidth: 5,
            dashSpace: 5,
          ),
        ),
        BarChart(
          BarChartData(
            alignment: BarChartAlignment.spaceAround,
            maxY: 60,
            barTouchData: BarTouchData(
              enabled: true,
              touchTooltipData: BarTouchTooltipData(
                getTooltipItem: (group, groupIndex, rod, rodIndex) {
                  return BarTooltipItem(
                    '${rod.toY - rod.fromY} units',
                    GoogleFonts.ibmPlexSans(
                      // Updated to IBM Plex Sans
                      color: Colors.white,
                    ),
                  );
                },
              ),
              touchCallback: (FlTouchEvent event, BarTouchResponse? response) {
                if (response != null && response.spot != null) {
                  print(
                      'Touched index: ${response.spot?.touchedBarGroupIndex}');
                }
              },
            ),
            titlesData: FlTitlesData(
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  interval: 10,
                  reservedSize: 40.w,
                  getTitlesWidget: (value, meta) => Text(
                    '${value.toInt()}k',
                    style: GoogleFonts.ibmPlexSans(
                      // Updated to IBM Plex Sans
                      color: Color(0xff2E263D66).withOpacity(0.4),
                    ),
                  ),
                ),
              ),
              rightTitles:
                  AxisTitles(sideTitles: SideTitles(showTitles: false)),
              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 30.h,
                  getTitlesWidget: (value, meta) {
                    final year = [
                      '2015',
                      '2016',
                      '2017',
                      '2018',
                      '2019',
                      '2020',
                      '2021'
                    ];
                    return Padding(
                      padding: EdgeInsets.only(top: 15.0.h),
                      child: Text(
                        year[value.toInt()],
                        style: GoogleFonts.ibmPlexSans(
                          // Updated to IBM Plex Sans
                          fontWeight: FontWeight.w400,
                          color: Color(0xff2E263D66).withOpacity(0.4),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            gridData: FlGridData(
              show: true,
              drawVerticalLine: false,
              drawHorizontalLine: true,
              getDrawingHorizontalLine: (value) {
                return FlLine(
                  color: Color(0xff2E263D1F).withOpacity(0.12),
                  strokeWidth: 1,
                  dashArray: [5, 5],
                );
              },
            ),
            borderData: FlBorderData(
              show: false,
            ),
            barGroups: [
              BarChartGroupData(
                x: 0,
                groupVertically: true,
                barRods: [
                  BarChartRodData(
                    fromY: 0,
                    toY: 28,
                    color: AppColors.kPrimaryLightBlue,
                    width: 6.w,
                  ),
                ],
              ),
              BarChartGroupData(
                groupVertically: true,
                x: 1,
                barRods: [
                  BarChartRodData(
                    fromY: 0,
                    toY: 20,
                    color: AppColors.kPrimaryLightBlue,
                    width: 6.w,
                  ),
                  BarChartRodData(
                    fromY: 22,
                    toY: 38,
                    color: AppColors.kPrimaryGreen,
                    width: 6.w,
                  ),
                ],
              ),
              BarChartGroupData(
                groupVertically: true,
                x: 2,
                barRods: [
                  BarChartRodData(
                    fromY: 0,
                    toY: 22,
                    color: AppColors.kPrimaryLightBlue,
                    width: 6.w,
                  ),
                  BarChartRodData(
                    fromY: 24,
                    toY: 34,
                    color: AppColors.kPrimaryGreen,
                    width: 6.w,
                  ),
                ],
              ),
              BarChartGroupData(
                groupVertically: true,
                x: 3,
                barRods: [
                  BarChartRodData(
                    fromY: 0,
                    toY: 18,
                    color: AppColors.kPrimaryLightBlue,
                    width: 6.w,
                  ),
                  BarChartRodData(
                    fromY: 20,
                    toY: 32,
                    color: AppColors.kPrimaryGreen,
                    width: 6.w,
                  ),
                  BarChartRodData(
                    fromY: 34,
                    toY: 46,
                    color: Color(0xff8A8D93),
                    width: 6.w,
                  ),
                ],
              ),
              BarChartGroupData(
                groupVertically: true,
                x: 4,
                barRods: [
                  BarChartRodData(
                    fromY: 0,
                    toY: 29,
                    color: AppColors.kPrimaryLightBlue,
                    width: 6.w,
                  ),
                ],
              ),
              BarChartGroupData(
                groupVertically: true,
                x: 5,
                barRods: [
                  BarChartRodData(
                    fromY: 0,
                    toY: 20,
                    color: AppColors.kPrimaryLightBlue,
                    width: 6.w,
                  ),
                  BarChartRodData(
                    fromY: 21,
                    toY: 31,
                    color: AppColors.kPrimaryGreen,
                    width: 6.w,
                  ),
                  BarChartRodData(
                    fromY: 33,
                    toY: 42,
                    color: Color(0xff8A8D93),
                    width: 6.w,
                  ),
                ],
              ),
              BarChartGroupData(
                groupVertically: true,
                x: 6,
                barRods: [
                  BarChartRodData(
                    fromY: 0,
                    toY: 34,
                    color: AppColors.kPrimaryLightBlue,
                    width: 6.w,
                  ),
                  BarChartRodData(
                    fromY: 36,
                    toY: 42,
                    color: AppColors.kPrimaryGreen,
                    width: 6.w,
                  ),
                  BarChartRodData(
                    fromY: 44,
                    toY: 56,
                    color: Color(0xff8A8D93),
                    width: 6.w,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class DashedBorderPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double dashWidth;
  final double dashSpace;
  final double leftOffset;

  DashedBorderPainter({
    required this.color,
    this.strokeWidth = 1.0,
    this.dashWidth = 5.0,
    this.dashSpace = 5.0,
    this.leftOffset = 42.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Color(0xff2E263D1F).withOpacity(0.12)
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final path = Path()
      ..moveTo(leftOffset, 0)
      ..lineTo(size.width, 0)
      ..moveTo(leftOffset, size.height - 30)
      ..lineTo(size.width, size.height - 30);

    _drawDashedPath(canvas, path, paint);
  }

  void _drawDashedPath(Canvas canvas, Path path, Paint paint) {
    final PathMetrics pathMetrics = path.computeMetrics();
    for (final PathMetric pathMetric in pathMetrics) {
      final length = pathMetric.length;
      final Path dashPath = Path();

      double distance = 0.0;
      while (distance < length) {
        final double start = distance;
        final double end = start + dashWidth;

        dashPath.addPath(
          pathMetric.extractPath(start, end < length ? end : length),
          Offset.zero,
        );

        distance += dashWidth + dashSpace;
      }

      canvas.drawPath(dashPath, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
