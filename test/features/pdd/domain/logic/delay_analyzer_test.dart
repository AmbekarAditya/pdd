import 'package:flutter_test/flutter_test.dart';
import 'package:pdd/core/domain/enums/movement_type.dart';
import 'package:pdd/core/domain/enums/train_type.dart';
import 'package:pdd/features/pdd/domain/entities/pdd_record.dart';
import 'package:pdd/features/pdd/domain/logic/delay_analyzer.dart';

void main() {
  group('DelayAnalyzer', () {
    test('Should return empty list for non-delayed train', () {
      final record = PddRecord(
        id: '1',
        trainNo: '12345',
        trainType: TrainType.mailExpress,
        movementType: MovementType.originating,
        // Scheduled: 10:00, Ready: 09:50 -> On Time
        scheduledDeparture: DateTime(2023, 1, 1, 10, 0),
        readyToDepart: DateTime(2023, 1, 1, 9, 50),
      );

      final causes = DelayAnalyzer.analyze(record);
      expect(causes, isEmpty);
    });

    test('Should identify excessive Loco Attachment time', () {
      final record = PddRecord(
        id: '2',
        trainNo: '12345',
        trainType: TrainType.mailExpress,
        movementType: MovementType.originating,
        // 1. Setup as Delayed: STD 10:00, Ready 10:30 (30m delay)
        scheduledDeparture: DateTime(2023, 1, 1, 10, 0),
        readyToDepart: DateTime(2023, 1, 1, 10, 30),
        // 2. Loco Attach took 20m (Limit 10m)
        rakeArrived: DateTime(2023, 1, 1, 9, 0),
        locoAttached: DateTime(2023, 1, 1, 9, 20),
      );

      final causes = DelayAnalyzer.analyze(record);
      expect(causes, isNotEmpty);
      expect(causes.first, contains('Loco Attachment took 20 mins'));
    });
    
    test('Should identify excessive Train Examination time', () {
      final record = PddRecord(
        id: '3',
        trainNo: '12345',
        trainType: TrainType.mailExpress,
        movementType: MovementType.originating,
        // Delayed
        scheduledDeparture: DateTime(2023, 1, 1, 10, 0),
        readyToDepart: DateTime(2023, 1, 1, 10, 30),
        // Exam took 40m (Limit 30m)
        examStart: DateTime(2023, 1, 1, 9, 0),
        examComplete: DateTime(2023, 1, 1, 9, 40),
      );

      final causes = DelayAnalyzer.analyze(record);
      expect(causes, isNotEmpty);
      expect(causes.any((c) => c.contains('Train Exam took 40 mins')), isTrue);
    });

    test('Should identify Crew Reporting late', () {
      final record = PddRecord(
        id: '4',
        trainNo: '12345',
        trainType: TrainType.mailExpress,
        movementType: MovementType.originating,
        // Delayed
        scheduledDeparture: DateTime(2023, 1, 1, 10, 0), // STD 10:00
        readyToDepart: DateTime(2023, 1, 1, 10, 30),
        // Crew Allowance: 15 mins before STD -> Target 9:45.
        // Crew Reported: 9:55 -> 10 mins late.
        crewReported: DateTime(2023, 1, 1, 9, 55),
      );

      final causes = DelayAnalyzer.analyze(record);
      expect(causes, isNotEmpty);
      expect(causes.any((c) => c.contains('Crew Reported late')), isTrue);
    });
  });
}
