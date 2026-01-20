import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/pdd_record.dart';
import '../../data/providers/pdd_repository_provider.dart';

part 'pdd_list_controller.g.dart';

@riverpod
class PddListController extends _$PddListController {
  @override
  Future<List<PddRecord>> build() async {
    final repository = ref.watch(pddRepositoryProvider);
    return repository.getAllRecords();
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(pddRepositoryProvider);
      return repository.getAllRecords();
    });
  }

  Future<void> addRecord(PddRecord record) async {
    final repository = ref.read(pddRepositoryProvider);
    await repository.saveRecord(record);
    // Refresh the list after adding
    await refresh();
  }
  
  Future<void> deleteRecord(String id) async {
    final repository = ref.read(pddRepositoryProvider);
    await repository.deleteRecord(id);
    await refresh();
  }
}
