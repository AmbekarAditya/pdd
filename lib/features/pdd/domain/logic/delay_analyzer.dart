import '../entities/pdd_record.dart';
import 'standard_allowances.dart';

class DelayAnalyzer {
  static List<String> analyze(PddRecord record) {
    // Only analyze if there is a PDD (Delay)
    if (!record.isDelayed || record.pdd == null) {
      return [];
    }

    final causes = <String>[];

    // 1. Analyze Loco Attachment (If both timestamps exist)
    if (record.locoAttached != null && record.rakeArrived != null) {
      final duration = record.locoAttached!.difference(record.rakeArrived!).inMinutes;
      if (duration > StandardAllowances.locoAttachment) {
        final excess = duration - StandardAllowances.locoAttachment;
        causes.add('Loco Attachment took $duration mins (Excess: $excess mins)');
      }
    }

    // 2. Analyze Train Examination (Exam Complete - Exam Start)
    if (record.examComplete != null && record.examStart != null) {
      final duration = record.examComplete!.difference(record.examStart!).inMinutes;
      if (duration > StandardAllowances.trainExamination) {
        final excess = duration - StandardAllowances.trainExamination;
        causes.add('Train Exam took $duration mins (Excess: $excess mins)');
      }
    }
    
    // 3. Analyze Crew Reporting
    // If Crew Reported AFTER (STD - Allowance)
    if (record.crewReported != null && record.scheduledDeparture != null) {
        // ideally crew should report X mins BEFORE STD.
        // If (STD - CrewReport) < Allowance, they are late.
        // Example: STD 10:00. Allowance 15. Target 9:45.
        // If Reported 9:50 -> 10 mins before -> Late by 5 mins.
        
        final timeBeforeStd = record.scheduledDeparture!.difference(record.crewReported!).inMinutes;
        if (timeBeforeStd < StandardAllowances.crewReporting) {
           final delay = StandardAllowances.crewReporting - timeBeforeStd;
           causes.add('Crew Reported late by $delay mins');
        }
    }

    return causes;
  }
}
