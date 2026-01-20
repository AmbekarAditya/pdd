import 'package:hive_flutter/hive_flutter.dart';
import '../../domain/entities/pdd_record.dart';
import 'pdd_repository.dart';

class HivePddRepository implements PddRepository {
  final Box _box = Hive.box('pdd_records');

  @override
  Future<void> saveRecord(PddRecord record) async {
    // Determine key. If new, use ID. If updating, use ID.
    // We use record.id as the Hive key for direct access.
    await _box.put(record.id, record);
  }

  @override
  Future<List<PddRecord>> getAllRecords() async {
    return _box.values.cast<PddRecord>().toList();
  }

  @override
  Future<void> deleteRecord(String id) async {
    await _box.delete(id);
  }
}
