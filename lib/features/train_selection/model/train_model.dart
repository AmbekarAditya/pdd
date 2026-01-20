import '../../../core/constants/train_type.dart';
import '../../../core/constants/movement_type.dart';
import '../../../core/constants/loco_type.dart';

class TrainModel {
  final String trainNumber;
  final DateTime date;
  final DateTime scheduledDeparture; // STD
  final TrainType trainType;
  final MovementType movementType;
  final LocoType locoType;

  const TrainModel({
    required this.trainNumber,
    required this.date,
    required this.scheduledDeparture,
    required this.trainType,
    required this.movementType,
    required this.locoType,
  });
}
