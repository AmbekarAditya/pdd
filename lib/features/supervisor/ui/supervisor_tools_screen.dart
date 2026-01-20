import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:developer' as developer;

import '../state/supervisor_provider.dart';
import '../../reports/state/report_provider.dart';
import '../../../core/services/export_service.dart';
import 'time_correction_screen.dart';

class SupervisorToolsScreen extends ConsumerWidget {
  const SupervisorToolsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reports = ref.watch(trainReportsProvider);
    final isSupervisor = ref.watch(supervisorModeProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Supervisor Tools')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Supervisor Toggle (Mock Auth)
            SwitchListTile(
              title: const Text('Enable Supervisor Mode'),
              subtitle: const Text('Simulates authentication'),
              value: isSupervisor,
              onChanged: (val) {
                ref.read(supervisorModeProvider.notifier).state = val;
              },
            ),
            const Divider(),
            
            const Text('Export Data', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              icon: const Icon(Icons.download),
              onPressed: () {
                final csv = ExportService.exportToCSV(reports);
                developer.log(csv, name: 'CSV_EXPORT');
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('CSV copied to logs (Console)')),
                );
              },
              label: const Text('Export CSV'),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              icon: const Icon(Icons.code),
              onPressed: () {
                final json = ExportService.exportToJSON(reports);
                developer.log(json, name: 'JSON_EXPORT');
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('JSON copied to logs (Console)')),
                );
              },
              label: const Text('Export JSON'),
            ),

            const Divider(height: 30),
            
            const Text('Corrections', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
             const SizedBox(height: 10),
            ElevatedButton.icon(
              icon: const Icon(Icons.edit),
              onPressed: isSupervisor ? () {
                 Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const TimeCorrectionScreen()),
                );
              } : null, // Disable if not supervisor
              label: const Text('Correct Event Times'),
            ),
          ],
        ),
      ),
    );
  }
}
