import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../data/repositories/train_repository.dart';
import 'train_state.dart';
import '../model/train_model.dart';

final trainRepositoryProvider = Provider<TrainRepository>((ref) {
  return TrainRepository();
});

final trainControllerProvider =
    StateNotifierProvider<TrainController, TrainState>((ref) {
  final repo = ref.read(trainRepositoryProvider);
  return TrainController(repo);
});

class TrainController extends StateNotifier<TrainState> {
  final TrainRepository repository;

  TrainController(this.repository)
      : super(TrainState(currentTrain: repository.getActiveTrain()));

  void startTrainSession(TrainModel train) {
    repository.saveTrain(train);
    state = TrainState(currentTrain: train);
  }

  void clearTrainSession() {
    repository.clearTrain();
    state = const TrainState();
  }
}
