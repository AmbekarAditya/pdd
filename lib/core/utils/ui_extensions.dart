import '../constants/train_type.dart';
import '../constants/movement_type.dart';
import '../constants/loco_type.dart';
import '../constants/department.dart';
import '../reasons/reason_level_2.dart';
import '../constants/events.dart';
import '../../features/pdd_calculation/model/pdd_result_model.dart';

extension TrainTypeExtension on TrainType {
  String get friendlyName {
    switch (this) {
      case TrainType.mailExpress:
        return 'Mail / Express';
      case TrainType.superfast:
        return 'Superfast';
      case TrainType.passenger:
        return 'Passenger';
      case TrainType.memuDemu:
        return 'MEMU / DEMU';
      case TrainType.vandeBharat:
        return 'Vande Bharat';
      case TrainType.rajdhaniShatabdiDuronto:
        return 'Rajdhani / Shatabdi / Duronto';
      case TrainType.special:
        return 'Special';
    }
  }
}

extension MovementTypeExtension on MovementType {
  String get friendlyName {
    switch (this) {
      case MovementType.originating:
        return 'Originating';
      case MovementType.terminating:
        return 'Terminating';
      case MovementType.through:
        return 'Through / Passing';
      case MovementType.turnaround:
        return 'Turnaround';
    }
  }
}

extension LocoTypeExtension on LocoType {
  String get friendlyName {
    switch (this) {
      case LocoType.wap7:
        return 'WAP-7 (Electric)';
      case LocoType.wap5:
         return 'WAP-5 (Electric)';
      case LocoType.wag9:
        return 'WAG-9 (Electric Freight)';
      case LocoType.wdm:
         return 'WDM (Diesel)';
      case LocoType.wdp:
         return 'WDP (Diesel)';
      case LocoType.emu:
         return 'EMU';
      case LocoType.memu:
         return 'MEMU';
      case LocoType.other:
        return 'Other';
    }
  }
}

extension DepartmentExtension on Department {
  String get friendlyName {
      // Capitalize first letter
      return name[0].toUpperCase() + name.substring(1);
  }
}

extension ReasonLevel2Extension on ReasonLevel2 {
   String get friendlyName {
      // Very basic formatting for now, can be improved.
      // e.g. crewIssue -> Crew Issue
      return name.replaceAllMapped(RegExp(r'([A-Z])'), (match) => ' ${match.group(0)}').trim().capitalize();
   }
}

extension PDDStatusExtension on PDDStatus {
  String get friendlyName {
    switch (this) {
      case PDDStatus.onTime:
        return 'On Time';
      case PDDStatus.atRisk:
        return 'At Risk';
      case PDDStatus.pdd:
        return 'Delayed (PDD)';
    }
  }
}

extension TrainEventTypeExtension on TrainEventType {
  String get friendlyName {
      switch (this) {
          case TrainEventType.rakeArrived: return 'Rake Arrived';
          case TrainEventType.crewReported: return 'Crew Reported';
          case TrainEventType.primaryExamStart: return 'Primary Exam Start';
          case TrainEventType.primaryExamComplete: return 'Primary Exam Complete'; // Changed from 'Primary Exam / C&W' to match standard terms
          case TrainEventType.brakePowerOk: return 'Brake Power OK';
          case TrainEventType.locoAttached: return 'Loco Attached';
          case TrainEventType.readyToDepart: return 'Ready To Depart';
          case TrainEventType.actualDeparture: return 'Actual Departure';
      }
  }
}

extension StringExtension on String {
    String capitalize() {
      if (isEmpty) return "";
      return "${this[0].toUpperCase()}${substring(1)}";
    }
}
