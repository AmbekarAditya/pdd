import 'package:hive_flutter/hive_flutter.dart';
import '../../../../core/domain/enums/train_type.dart';
import '../../../../core/domain/enums/movement_type.dart';
import '../../../../core/domain/enums/loco_type.dart';
import '../../domain/entities/pdd_record.dart';

class PddRecordAdapter extends TypeAdapter<PddRecord> {
  @override
  final int typeId = 0;

  @override
  PddRecord read(BinaryReader reader) {
    return PddRecord(
      id: reader.readString(),
      trainNo: reader.readString(),
      trainType: reader.read() as TrainType,
      movementType: reader.read() as MovementType,
      locoType: reader.read() as LocoType?,
      rakeArrived: _readDate(reader),
      locoAttached: _readDate(reader),
      examStart: _readDate(reader),
      examComplete: _readDate(reader),
      brakePowerOk: _readDate(reader),
      crewReported: _readDate(reader),
      readyToDepart: _readDate(reader),
      scheduledDeparture: _readDate(reader),
      actualDeparture: _readDate(reader),
    );
  }

  @override
  void write(BinaryWriter writer, PddRecord obj) {
    writer.writeString(obj.id);
    writer.writeString(obj.trainNo);
    writer.write(obj.trainType);
    writer.write(obj.movementType);
    writer.write(obj.locoType);
    _writeDate(writer, obj.rakeArrived);
    _writeDate(writer, obj.locoAttached);
    _writeDate(writer, obj.examStart);
    _writeDate(writer, obj.examComplete);
    _writeDate(writer, obj.brakePowerOk);
    _writeDate(writer, obj.crewReported);
    _writeDate(writer, obj.readyToDepart);
    _writeDate(writer, obj.scheduledDeparture);
    _writeDate(writer, obj.actualDeparture);
  }

  DateTime? _readDate(BinaryReader reader) {
    final millis = reader.readInt();
    return millis == -1 ? null : DateTime.fromMillisecondsSinceEpoch(millis);
  }

  void _writeDate(BinaryWriter writer, DateTime? date) {
    writer.writeInt(date?.millisecondsSinceEpoch ?? -1);
  }
}
