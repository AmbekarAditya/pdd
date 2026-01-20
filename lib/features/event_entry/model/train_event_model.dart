import '../../../core/constants/events.dart';

class TrainEventModel {
  final TrainEventType type;
  final DateTime time;

  const TrainEventModel({
    required this.type,
    required this.time,
  });
}
