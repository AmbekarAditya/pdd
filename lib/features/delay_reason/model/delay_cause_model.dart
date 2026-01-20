import '../../../core/constants/department.dart';
import '../../../core/reasons/reason_level_1.dart';
import '../../../core/reasons/reason_level_2.dart';
import '../../../core/reasons/reason_level_3.dart';
import '../../../core/constants/events.dart';

class DelayCause {
  final TrainEventType triggeringEvent;
  final Department department;
  final ReasonLevel1 level1;
  final ReasonLevel2 level2;
  final ReasonLevel3? level3;
  final bool isPrimary;

  const DelayCause({
    required this.triggeringEvent,
    required this.department,
    required this.level1,
    required this.level2,
    this.level3,
    required this.isPrimary,
  });
}
