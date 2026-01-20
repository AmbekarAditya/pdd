import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../repositories/pdd_repository.dart';
import '../repositories/hive_pdd_repository.dart';

part 'pdd_repository_provider.g.dart';

@riverpod
PddRepository pddRepository(Ref ref) {
  return HivePddRepository();
}
