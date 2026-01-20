import 'package:hive/hive.dart';
import '../hive/hive_boxes.dart';
import '../adapters/station_adapter.dart';
import '../../features/station_setup/model/station_model.dart'; // Import domain model

class StationRepository {
  Box<StationHiveModel> get _box =>
      Hive.box<StationHiveModel>(HiveBoxes.station);

  StationModel? getStation() {
    if (_box.isEmpty) return null;
    final hiveModel = _box.getAt(0);
    // Convert Hive model back to Domain model
    return StationModel(
      stationCode: hiveModel!.stationCode,
      stationName: hiveModel.stationName,
      defaultPlatform: hiveModel.defaultPlatform,
    );
  }

  void saveStation(StationModel station) {
    _box.clear();
    // Convert Domain model to Hive model
    _box.add(StationHiveModel(
      stationCode: station.stationCode,
      stationName: station.stationName,
      defaultPlatform: station.defaultPlatform,
    ));
  }

  bool hasStation() => _box.isNotEmpty;
}
