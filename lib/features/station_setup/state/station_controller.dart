import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/repositories/station_repository.dart';
import 'station_state.dart';
import '../model/station_model.dart';

final stationRepositoryProvider =
    Provider<StationRepository>((ref) {
  return StationRepository();
});

final stationControllerProvider =
    StateNotifierProvider<StationController, StationState>((ref) {
  final repo = ref.read(stationRepositoryProvider);
  return StationController(repo);
});

class StationController extends StateNotifier<StationState> {
  final StationRepository repository;

  StationController(this.repository)
      : super(StationState(station: repository.getStation()));

  void configureStation(StationModel station) {
    repository.saveStation(station);
    state = StationState(station: station);
  }
}
