import 'package:hive_flutter/hive_flutter.dart';
import '../../../../core/domain/enums/movement_type.dart';

class MovementTypeAdapter extends TypeAdapter<MovementType> {
  @override
  final int typeId = 2;

  @override
  MovementType read(BinaryReader reader) {
    return MovementType.values[reader.readByte()];
  }

  @override
  void write(BinaryWriter writer, MovementType obj) {
    writer.writeByte(obj.index);
  }
}
