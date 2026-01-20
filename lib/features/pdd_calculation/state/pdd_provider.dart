import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../train_selection/state/train_controller.dart';
import '../../event_entry/state/event_controller.dart';
import '../../../core/services/pdd_calculator.dart';
import '../model/pdd_result_model.dart';
import '../../../core/constants/events.dart';

final pddProvider = Provider<PDDResult>((ref) {
  final trainState = ref.watch(trainControllerProvider);
  final eventState = ref.watch(eventControllerProvider);

  final train = trainState.currentTrain;

  if (train == null) {
    return const PDDResult(
      status: PDDStatus.onTime,
      pddDuration: Duration.zero,
      readyTime: null,
    );
  }

  final events = <TrainEventType, DateTime>{};

  for (final e in eventState.events.values) {
    events[e.type] = e.time;
  }

  return PDDCalculator.calculate(
    std: train.scheduledDeparture,
    events: events,
  );
});
