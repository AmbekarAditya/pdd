import '../../features/pdd_calculation/model/pdd_result_model.dart';
import '../../core/constants/events.dart';

class PDDCalculator {
  static PDDResult calculate({
    required DateTime std,
    required Map<TrainEventType, DateTime> events,
  }) {
    final readyTime = events[TrainEventType.readyToDepart];

    // If not ready yet
    if (readyTime == null) {
      // If STD crossed and still not ready → at risk
      if (DateTime.now().isAfter(std)) {
        return const PDDResult(
          status: PDDStatus.atRisk,
          pddDuration: Duration.zero,
          readyTime: null,
        );
      }

      // STD not crossed yet
      return const PDDResult(
        status: PDDStatus.onTime,
        pddDuration: Duration.zero,
        readyTime: null,
      );
    }

    // Ready time available
    if (readyTime.isAfter(std)) {
      return PDDResult(
        status: PDDStatus.pdd,
        pddDuration: readyTime.difference(std),
        readyTime: readyTime,
      );
    }

    // Ready before STD
    return PDDResult(
      status: PDDStatus.onTime,
      pddDuration: Duration.zero,
      readyTime: readyTime,
    );
  }
}
