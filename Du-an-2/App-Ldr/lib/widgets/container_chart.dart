import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';

class SimpleBarChart extends StatelessWidget {
  const SimpleBarChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 400,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
              color: AppColor.kPrimaryPurpleStart
          )
      ),
      child: BarChart(
        BarChartData(
          maxY: 10,
          borderData: FlBorderData(show: false),
          gridData: FlGridData(show: false),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            rightTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            topTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, _) {
                  switch (value.toInt()) {
                    case 0:
                      return const Text("Mon");
                    case 1:
                      return const Text("Tue");
                    case 2:
                      return const Text("Wed");
                    case 3:
                      return const Text("Thu");
                    case 4:
                      return const Text("Fri");
                  }
                  return const SizedBox();
                },
              ),
            ),
          ),

          // ⭐ Các cột giống hình
          barGroups: [
            BarChartGroupData(
              x: 0,
              barRods: [
                BarChartRodData(
                  toY: 4,
                  width: 24,
                  borderRadius: BorderRadius.circular(6),
                  color: AppColor.kAccentBlue.withOpacity(0.3),
                )
              ],
            ),
            BarChartGroupData(
              x: 1,
              barRods: [
                BarChartRodData(
                  toY: 6,
                  width: 24,
                  borderRadius: BorderRadius.circular(6),
                  color: AppColor.kAccentBlue.withOpacity(0.3),
                )
              ],
            ),
            BarChartGroupData(
              x: 2,
              barRods: [
                BarChartRodData(
                  toY: 8,
                  width: 24,
                  borderRadius: BorderRadius.circular(6),
                  color: AppColor.kPrimaryPurpleStart.withOpacity(0.8),
                )
              ],
            ),
            BarChartGroupData(
              x: 3,
              barRods: [
                BarChartRodData(
                  toY: 3,
                  width: 24,
                  borderRadius: BorderRadius.circular(6),
                  color: AppColor.kAccentBlue.withOpacity(0.3),
                )
              ],
            ),
            BarChartGroupData(
              x: 4,
              barRods: [
                BarChartRodData(
                  toY: 5,
                  width: 24,
                  borderRadius: BorderRadius.circular(6),
                  color: AppColor.kAccentBlue.withOpacity(0.3),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
