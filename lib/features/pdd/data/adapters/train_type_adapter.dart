import 'package:hive_flutter/hive_flutter.dart';
import '../../../../core/domain/enums/train_type.dart';

class TrainTypeAdapter extends TypeAdapter<TrainType> {
  @override
  final int typeId = 1;

  @override
  TrainType read(BinaryReader reader) {
    return TrainType.values[reader.readByte()];
  }

  @override
  void write(BinaryWriter writer, TrainType obj) {
    writer.writeByte(obj.index);
  }
}
