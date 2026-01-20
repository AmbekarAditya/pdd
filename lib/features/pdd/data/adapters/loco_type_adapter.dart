import 'package:hive_flutter/hive_flutter.dart';
import '../../../../core/domain/enums/loco_type.dart';

class LocoTypeAdapter extends TypeAdapter<LocoType> {
  @override
  final int typeId = 3;

  @override
  LocoType read(BinaryReader reader) {
    return LocoType.values[reader.readByte()];
  }

  @override
  void write(BinaryWriter writer, LocoType obj) {
    writer.writeByte(obj.index);
  }
}
