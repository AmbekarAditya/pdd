import 'package:flutter_test/flutter_test.dart';

import 'package:pdd/core/domain/enums/movement_type.dart';
import 'package:pdd/core/domain/enums/train_type.dart';
import 'package:pdd/features/pdd/domain/entities/pdd_record.dart';

void main() {
  group('PddRecord', () {
    test('Calculates positive PDD correctly', () {
      final std = DateTime(2023, 10, 1, 10, 0); // 10:00 AM
      final ready = DateTime(2023, 10, 1, 10, 30); // 10:30 AM

      final record = PddRecord(
        id: '1',
        trainNo: '12345',
        trainType: TrainType.mailExpress,
        movementType: MovementType.originating,
        scheduledDeparture: std,
        readyToDepart: ready,
      );

      expect(record.pdd, equals(const Duration(minutes: 30)));
      expect(record.isDelayed, isTrue);
    });

    test('Returns zero PDD if early', () {
      final std = DateTime(2023, 10, 1, 10, 0);
      final ready = DateTime(2023, 10, 1, 9, 50); // 9:50 AM

      final record = PddRecord(
        id: '1',
        trainNo: '12345',
        trainType: TrainType.mailExpress,
        movementType: MovementType.originating,
        scheduledDeparture: std,
        readyToDepart: ready,
      );

      expect(record.pdd, equals(Duration.zero));
      expect(record.isDelayed, isFalse);
    });

    test('Returns zero PDD if on time', () {
      final std = DateTime(2023, 10, 1, 10, 0);
      final ready = DateTime(2023, 10, 1, 10, 0);

      final record = PddRecord(
        id: '1',
        trainNo: '12345',
        trainType: TrainType.mailExpress,
        movementType: MovementType.originating,
        scheduledDeparture: std,
        readyToDepart: ready,
      );

      expect(record.pdd, equals(Duration.zero));
      expect(record.isDelayed, isFalse);
    });
  });
}
