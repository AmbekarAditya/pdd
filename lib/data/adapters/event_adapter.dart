import 'package:hive/hive.dart';
import '../../core/constants/events.dart';

class EventHiveModel {
  final TrainEventType type;
  final DateTime time;

  EventHiveModel({
    required this.type,
    required this.time,
  });
}

class EventHiveModelAdapter extends TypeAdapter<EventHiveModel> {
  @override
  final int typeId = 3;

  @override
  EventHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EventHiveModel(
      type: TrainEventType.values[fields[0] as int],
      time: fields[1] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, EventHiveModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.type.index)
      ..writeByte(1)
      ..write(obj.time);
  }
}
