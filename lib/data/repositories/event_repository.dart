import 'package:hive/hive.dart';
import '../hive/hive_boxes.dart';
import '../adapters/event_adapter.dart';
import '../../features/event_entry/model/train_event_model.dart';
import '../../core/constants/events.dart';

class EventRepository {
  Box<EventHiveModel> get _box =>
      Hive.box<EventHiveModel>(HiveBoxes.events);

  Map<TrainEventType, TrainEventModel> getEvents() {
    final map = <TrainEventType, TrainEventModel>{};
    for (var hiveModel in _box.values) {
      map[hiveModel.type] = TrainEventModel(
        type: hiveModel.type,
        time: hiveModel.time,
      );
    }
    return map;
  }

  void saveEvent(TrainEventModel event) {
    _box.add(EventHiveModel(
      type: event.type,
      time: event.time,
    ));
  }

  void clearEvents() => _box.clear();
}
