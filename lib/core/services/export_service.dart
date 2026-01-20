import 'dart:convert';
import '../../features/reports/model/train_report_model.dart';

class ExportService {
  static String exportToCSV(List<TrainReport> reports) {
    final buffer = StringBuffer();
    // Header
    buffer.writeln(
        'Train No,Date,Status,PDD Minutes,Primary Cause Level 2,Department');

    for (final r in reports) {
      buffer.writeln(
        '${r.train.trainNumber},'
        '${r.train.date.toIso8601String().split('T')[0]},'
        '${r.pddResult.status.name},'
        '${r.pddResult.pddDuration.inMinutes},'
        '${r.primaryCause?.level2.name ?? "N/A"},'
        '${r.primaryCause?.department.name ?? "N/A"}',
      );
    }
    return buffer.toString();
  }

  static String exportToJSON(List<TrainReport> reports) {
    final jsonList = reports.map((r) => {
          'trainNumber': r.train.trainNumber,
          'date': r.train.date.toIso8601String(),
          'status': r.pddResult.status.name,
          'pddMinutes': r.pddResult.pddDuration.inMinutes,
          'primaryCause': r.primaryCause?.level2.name,
          'department': r.primaryCause?.department.name,
        });

    return jsonEncode(jsonList.toList());
  }
}
