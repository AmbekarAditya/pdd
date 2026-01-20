import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/supervisor_provider.dart';
import '../../../core/services/audit_service.dart';
import '../model/audit_log_model.dart';

class TimeCorrectionScreen extends ConsumerWidget {
  const TimeCorrectionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSupervisor = ref.watch(supervisorModeProvider);

    if (!isSupervisor) {
      return const Scaffold(
        body: Center(child: Text('Supervisor access required')),
      );
    }

    final audit = AuditService();

    return Scaffold(
      appBar: AppBar(title: const Text('Time Correction')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             const Text('Select an event to correct (Mock Functionality)'),
             const SizedBox(height: 20),
             ElevatedButton(
              onPressed: () {
                // Example placeholder for correction
                audit.record(
                  AuditLog(
                    timestamp: DateTime.now(),
                    action: 'Time corrected',
                    performedBy: 'Supervisor',
                    details: 'Brake Power OK time adjusted manually',
                  ),
                );
                
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Correction recorded in Audit Log')),
                );
              },
              child: const Text('Record Sample Correction'),
            ),
          ],
        ),
      ),
    );
  }
}
