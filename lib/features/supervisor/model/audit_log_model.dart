class AuditLog {
  final DateTime timestamp;
  final String action;
  final String performedBy;
  final String details;

  const AuditLog({
    required this.timestamp,
    required this.action,
    required this.performedBy,
    required this.details,
  });
}
