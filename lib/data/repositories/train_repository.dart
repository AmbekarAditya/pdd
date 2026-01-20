import 'package:hive/hive.dart';
import '../hive/hive_boxes.dart';
import '../adapters/train_adapter.dart';
import '../../features/train_selection/model/train_model.dart';

class TrainRepository {
  Box<TrainHiveModel> get _box =>
      Hive.box<TrainHiveModel>(HiveBoxes.train);

  TrainModel? getActiveTrain() {
    if (_box.isEmpty) return null;
    final hiveModel = _box.getAt(0);
    return TrainModel(
      trainNumber: hiveModel!.trainNumber,
      date: hiveModel.date,
      scheduledDeparture: hiveModel.std,
      trainType: hiveModel.trainType,
      movementType: hiveModel.movementType,
      locoType: hiveModel.locoType,
    );
  }

  void saveTrain(TrainModel train) {
    _box.clear();
    _box.add(TrainHiveModel(
      trainNumber: train.trainNumber,
      date: train.date,
      std: train.scheduledDeparture,
      trainType: train.trainType,
      movementType: train.movementType,
      locoType: train.locoType,
    ));
  }

  void clearTrain() => _box.clear();
}
