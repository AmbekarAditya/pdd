import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../train_selection/state/train_controller.dart';
import '../../pdd_calculation/state/pdd_provider.dart';
import '../../delay_reason/state/delay_cause_provider.dart';
import '../model/train_report_model.dart';
import '../../../core/services/report_aggregator.dart';
import '../model/daily_summary_model.dart';

final trainReportsProvider =
    Provider<List<TrainReport>>((ref) {
  final trainState = ref.watch(trainControllerProvider);
  final pdd = ref.watch(pddProvider);
  final causes = ref.watch(delayCauseProvider);

  if (trainState.currentTrain == null) return [];

  // V1 Simplification: Only reporting on the *currently active* train session
  // In future phases, we would fetch historical sessions from a repository
  return [
    TrainReport(
      train: trainState.currentTrain!,
      pddResult: pdd,
      primaryCause: 
          causes.isEmpty ? null : causes.firstWhere((c) => c.isPrimary, orElse: () => causes.first),
    )
  ];
});

final dailySummaryProvider =
    Provider<DailySummary>((ref) {
  final reports = ref.watch(trainReportsProvider);
  return ReportAggregator.buildDailySummary(reports);
});
