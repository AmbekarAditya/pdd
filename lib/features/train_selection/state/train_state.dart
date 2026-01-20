import '../model/train_model.dart';

class TrainState {
  final TrainModel? currentTrain;

  const TrainState({this.currentTrain});

  bool get hasActiveTrain => currentTrain != null;
}
