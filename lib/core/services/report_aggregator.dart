import '../../features/reports/model/daily_summary_model.dart';
import '../../features/reports/model/train_report_model.dart';
import '../../features/pdd_calculation/model/pdd_result_model.dart';

class ReportAggregator {
  static DailySummary buildDailySummary(
      List<TrainReport> reports) {
    int onTime = 0, pdd = 0, atRisk = 0, totalPddMin = 0;

    for (final r in reports) {
      switch (r.pddResult.status) {
        case PDDStatus.onTime:
          onTime++;
          break;
        case PDDStatus.atRisk:
          atRisk++;
          break;
        case PDDStatus.pdd:
          pdd++;
          totalPddMin += r.pddResult.pddDuration.inMinutes;
          break;
      }
    }

    return DailySummary(
      totalTrains: reports.length,
      onTimeTrains: onTime,
      pddTrains: pdd,
      atRiskTrains: atRisk,
      totalPddMinutes: totalPddMin,
    );
  }
}
