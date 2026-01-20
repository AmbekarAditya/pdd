import 'package:hive/hive.dart';

class StationHiveModel {
  final String stationCode;
  final String stationName;
  final int defaultPlatform;

  StationHiveModel({
    required this.stationCode,
    required this.stationName,
    required this.defaultPlatform,
  });
}

class StationHiveModelAdapter extends TypeAdapter<StationHiveModel> {
  @override
  final int typeId = 1;

  @override
  StationHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StationHiveModel(
      stationCode: fields[0] as String,
      stationName: fields[1] as String,
      defaultPlatform: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, StationHiveModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.stationCode)
      ..writeByte(1)
      ..write(obj.stationName)
      ..writeByte(2)
      ..write(obj.defaultPlatform);
  }
}
