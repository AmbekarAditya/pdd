import '../../features/supervisor/model/audit_log_model.dart';

class AuditService {
  // Singleton instance
  static final AuditService _instance = AuditService._internal();
  factory AuditService() => _instance;
  AuditService._internal();

  final List<AuditLog> _logs = [];

  void record(AuditLog log) {
    _logs.add(log);
    // In future: persist to Hive
  }

  List<AuditLog> getLogs() => List.unmodifiable(_logs);
}
