import '../../features/delay_reason/model/delay_cause_model.dart';
import '../constants/events.dart';
import '../constants/department.dart';
import '../reasons/reason_level_1.dart';
import '../reasons/reason_level_2.dart';

class DelayCauseDetector {
  static List<DelayCause> detect({
    required DateTime std,
    required Map<TrainEventType, DateTime> events,
  }) {
    final List<DelayCause> causes = [];

    // Sort events by time
    final sortedEvents = events.entries.toList()
      ..sort((a, b) => a.value.compareTo(b.value));

    // Identify first event AFTER STD (primary cause)
    final primary = sortedEvents.firstWhere(
      (e) => e.value.isAfter(std),
      orElse: () => sortedEvents.last, // Fallback, though logical PDD implies at least one
    );

    // If NO event is after STD, there are no causes (logic check)
    // However, this detector is usually called ONLY when PDD exists.
    if (!primary.value.isAfter(std)) {
       return [];
    }

    causes.add(
      _mapEventToCause(
        event: primary.key,
        isPrimary: true,
      ),
    );

    // Cascading causes = other events after STD that happen AFTER the primary one (or just list all delays?)
    // Requirements say: "Cascading causes = other events after STD"
    // We should probably only list SUBSEQUENT delays, or just all of them.
    // The reference code iterates through sortedEvents.
    
    for (final entry in sortedEvents) {
      if (entry.key == primary.key) continue;
      if (entry.value.isAfter(std)) {
        causes.add(
          _mapEventToCause(
            event: entry.key,
            isPrimary: false,
          ),
        );
      }
    }

    return causes;
  }

  static DelayCause _mapEventToCause({
    required TrainEventType event,
    required bool isPrimary,
  }) {
    switch (event) {
      case TrainEventType.crewReported:
        return DelayCause(
          triggeringEvent: event,
          department: Department.operating,
          level1: ReasonLevel1.operating,
          level2: ReasonLevel2.crewIssue,
          isPrimary: isPrimary,
        );

      case TrainEventType.primaryExamComplete:
      case TrainEventType.brakePowerOk:
        return DelayCause(
          triggeringEvent: event,
          department: Department.mechanical,
          level1: ReasonLevel1.mechanical,
          level2: ReasonLevel2.brakeIssue,
          isPrimary: isPrimary,
        );

      case TrainEventType.locoAttached:
        return DelayCause(
          triggeringEvent: event,
          department: Department.electrical,
          level1: ReasonLevel1.electrical,
          level2: ReasonLevel2.locoFailure,
          isPrimary: isPrimary,
        );

      default:
        return DelayCause(
          triggeringEvent: event,
          department: Department.operating,
          level1: ReasonLevel1.operating,
          level2: ReasonLevel2.controlHold,
          isPrimary: isPrimary,
        );
    }
  }
}
