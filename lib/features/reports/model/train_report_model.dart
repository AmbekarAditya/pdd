import '../../pdd_calculation/model/pdd_result_model.dart';
import '../../delay_reason/model/delay_cause_model.dart';
import '../../train_selection/model/train_model.dart';

class TrainReport {
  final TrainModel train;
  final PDDResult pddResult;
  final DelayCause? primaryCause;

  const TrainReport({
    required this.train,
    required this.pddResult,
    required this.primaryCause,
  });
}
