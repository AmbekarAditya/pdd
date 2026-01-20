import '../../domain/entities/pdd_record.dart';

abstract class PddRepository {
  Future<void> saveRecord(PddRecord record);
  Future<List<PddRecord>> getAllRecords();
  Future<void> deleteRecord(String id);
}
