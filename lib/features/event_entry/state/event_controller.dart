import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../data/repositories/event_repository.dart';
import 'event_state.dart';
import '../model/train_event_model.dart';
import '../../../core/constants/events.dart';

final eventRepositoryProvider = Provider<EventRepository>((ref) {
  return EventRepository();
});

final eventControllerProvider =
    StateNotifierProvider<EventController, EventState>((ref) {
  final repo = ref.read(eventRepositoryProvider);
  return EventController(repo);
});

class EventController extends StateNotifier<EventState> {
  final EventRepository repository;

  EventController(this.repository)
      : super(EventState(events: repository.getEvents()));

  void recordEvent(TrainEventType type, [DateTime? specificTime]) {
    if (state.events.containsKey(type)) return;

    final event = TrainEventModel(
      type: type,
      time: specificTime ?? DateTime.now(),
    );

    repository.saveEvent(event);

    final updated = Map<TrainEventType, TrainEventModel>.from(state.events)
      ..[type] = event;

    state = EventState(events: updated);
  }

  void resetEvents() {
    repository.clearEvents();
    state = const EventState(events: {});
  }
}
