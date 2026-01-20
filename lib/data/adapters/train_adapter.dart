import 'package:hive/hive.dart';
import '../../core/constants/train_type.dart';
import '../../core/constants/movement_type.dart';
import '../../core/constants/loco_type.dart';

class TrainHiveModel {
  final String trainNumber;
  final DateTime date;
  final DateTime std;
  final TrainType trainType;
  final MovementType movementType;
  final LocoType locoType;

  TrainHiveModel({
    required this.trainNumber,
    required this.date,
    required this.std,
    required this.trainType,
    required this.movementType,
    required this.locoType,
  });
}

class TrainHiveModelAdapter extends TypeAdapter<TrainHiveModel> {
  @override
  final int typeId = 2;

  @override
  TrainHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TrainHiveModel(
      trainNumber: fields[0] as String,
      date: fields[1] as DateTime,
      std: fields[2] as DateTime,
      trainType: TrainType.values[fields[3] as int],
      movementType: MovementType.values[fields[4] as int],
      locoType: LocoType.values[fields[5] as int],
    );
  }

  @override
  void write(BinaryWriter writer, TrainHiveModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.trainNumber)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.std)
      ..writeByte(3)
      ..write(obj.trainType.index)
      ..writeByte(4)
      ..write(obj.movementType.index)
      ..writeByte(5)
      ..write(obj.locoType.index);
  }
}
