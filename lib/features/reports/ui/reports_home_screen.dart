import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../state/report_provider.dart';
import 'train_report_screen.dart';
import '../../supervisor/ui/supervisor_tools_screen.dart';

class ReportsHomeScreen extends ConsumerWidget {
  const ReportsHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final summary = ref.watch(dailySummaryProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Daily Summary')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _tile('Total Trains', summary.totalTrains),
            _tile('On Time', summary.onTimeTrains),
            _tile('PDD', summary.pddTrains),
            _tile('At Risk', summary.atRiskTrains),
            _tile('Total PDD (min)', summary.totalPddMinutes),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const TrainReportScreen()),
                );
              },
              icon: const Icon(Icons.list),
              label: const Text('View Details (Train-wise)'),
            ),
             const SizedBox(height: 12),
             OutlinedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const SupervisorToolsScreen()),
                );
              },
              icon: const Icon(Icons.admin_panel_settings),
              label: const Text('Supervisor Tools'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tile(String label, int value) {
    return Card(
      child: ListTile(
        title: Text(label),
        trailing: Text(
          value.toString(),
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
    );
  }
}
