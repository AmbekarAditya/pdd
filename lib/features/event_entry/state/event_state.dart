import '../model/train_event_model.dart';
import '../../../core/constants/events.dart';

class EventState {
  final Map<TrainEventType, TrainEventModel> events;

  const EventState({required this.events});

  bool hasEvent(TrainEventType type) => events.containsKey(type);

  DateTime? eventTime(TrainEventType type) =>
      events[type]?.time;
}
