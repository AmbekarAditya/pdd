import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../train_selection/state/train_controller.dart';
import '../../event_entry/state/event_controller.dart';
import '../../pdd_calculation/state/pdd_provider.dart';
import '../../../core/services/delay_cause_detector.dart';
import '../model/delay_cause_model.dart';
import '../../../core/constants/events.dart';

final delayCauseProvider = Provider<List<DelayCause>>((ref) {
  final pdd = ref.watch(pddProvider);
  if (!pdd.hasPDD) return [];

  final eventState = ref.watch(eventControllerProvider);
  final trainState = ref.watch(trainControllerProvider);
  final train = trainState.currentTrain;

  if (train == null) return [];

  final events = <TrainEventType, DateTime>{};
  for (final e in eventState.events.values) {
    events[e.type] = e.time;
  }

  return DelayCauseDetector.detect(
    std: train.scheduledDeparture,
    events: events,
  );
});
