class DailySummary {
  final int totalTrains;
  final int onTimeTrains;
  final int pddTrains;
  final int atRiskTrains;
  final int totalPddMinutes;

  const DailySummary({
    required this.totalTrains,
    required this.onTimeTrains,
    required this.pddTrains,
    required this.atRiskTrains,
    required this.totalPddMinutes,
  });
}
