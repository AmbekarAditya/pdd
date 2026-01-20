import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../model/daily_summary_model.dart';

class PddSummaryChart extends StatelessWidget {
  final DailySummary summary;

  const PddSummaryChart({super.key, required this.summary});

  @override
  Widget build(BuildContext context) {
    // If no data, show empty state
    if (summary.totalTrains == 0) {
      return SizedBox(
        height: 200,
        child: Center(
          child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Icon(Icons.pie_chart_outline, size: 60, color: Colors.grey.shade300),
               const SizedBox(height: 8),
               Text('No data recorded today', style: TextStyle(color: Colors.grey.shade500)),
             ],
          ),
        ),
      );
    }

    return SizedBox(
      height: 220,
      child: Stack(
          children: [
              PieChart(
                PieChartData(
                  sectionsSpace: 2,
                  centerSpaceRadius: 50,
                  sections: _buildSections(),
                ),
              ),
              Center(
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                          Text(
                              summary.totalTrains.toString(),
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                          ),
                          const Text('Trains', style: TextStyle(fontSize: 12, color: Colors.grey)),
                      ],
                  ),
              )
          ],
      ),
    );
  }

  List<PieChartSectionData> _buildSections() {
    const double radius = 50;
    const double fontSize = 14;
    // const shadowColor = Colors.black12; // Unused

    final List<PieChartSectionData> sections = [];

    if (summary.onTimeTrains > 0) {
      sections.add(PieChartSectionData(
        color: Colors.green,
        value: summary.onTimeTrains.toDouble(),
        title: '${summary.onTimeTrains}', // Simple number
        radius: radius,
        titleStyle: const TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold, color: Colors.white),
      ));
    }

    if (summary.atRiskTrains > 0) {
      sections.add(PieChartSectionData(
        color: Colors.orange,
        value: summary.atRiskTrains.toDouble(),
        title: '${summary.atRiskTrains}',
        radius: radius,
        titleStyle: const TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold, color: Colors.white),
      ));
    }

    if (summary.pddTrains > 0) {
      sections.add(PieChartSectionData(
        color: Colors.red,
        value: summary.pddTrains.toDouble(),
        title: '${summary.pddTrains}',
        radius: radius,
        titleStyle: const TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold, color: Colors.white),
      ));
    }

    return sections;
  }
}
