import '../model/station_model.dart';

class StationState {
  final StationModel? station;

  const StationState({this.station});

  bool get isConfigured => station != null;
}
