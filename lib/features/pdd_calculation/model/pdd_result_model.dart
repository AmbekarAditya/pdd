enum PDDStatus {
  onTime,
  atRisk,
  pdd,
}

class PDDResult {
  final PDDStatus status;
  final Duration pddDuration;
  final DateTime? readyTime;

  const PDDResult({
    required this.status,
    required this.pddDuration,
    required this.readyTime,
  });

  bool get hasPDD => pddDuration.inMinutes > 0;
}
