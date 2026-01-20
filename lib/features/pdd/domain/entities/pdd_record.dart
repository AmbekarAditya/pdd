import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/domain/enums/train_type.dart';
import '../../../../core/domain/enums/movement_type.dart';
import '../../../../core/domain/enums/loco_type.dart';

part 'pdd_record.freezed.dart';

@freezed
class PddRecord with _$PddRecord {
  const PddRecord._();

  const factory PddRecord({
    required String id,
    required String trainNo,
    required TrainType trainType,
    required MovementType movementType,
    LocoType? locoType,
    DateTime? rakeArrived,
    DateTime? locoAttached,
    DateTime? examStart,
    DateTime? examComplete,
    DateTime? brakePowerOk,
    DateTime? crewReported,
    DateTime? readyToDepart,
    DateTime? scheduledDeparture,
    DateTime? actualDeparture,
  }) = _PddRecord;

  /// Calculates PDD (Pre-Departure Detention)
  /// PDD = Ready - STD
  /// If Ready > STD, PDD is the difference.
  /// If Ready <= STD, PDD is zero.
  Duration? get pdd {
    if (readyToDepart == null || scheduledDeparture == null) return null;
    
    final diff = readyToDepart!.difference(scheduledDeparture!);
    return diff.isNegative ? Duration.zero : diff;
  }

  bool get isDelayed => (pdd?.inMinutes ?? 0) > 0;
}
