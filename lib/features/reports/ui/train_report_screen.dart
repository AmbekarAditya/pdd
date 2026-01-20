import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/utils/ui_extensions.dart'; // Import extensions

import '../state/report_provider.dart';

class TrainReportScreen extends ConsumerWidget {
  const TrainReportScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reports = ref.watch(trainReportsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Train-wise Report')),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: reports.map((r) {
          return Card(
            child: ListTile(
              leading: const Icon(Icons.train),
              title: Text('Train ${r.train.trainNumber}'),
              subtitle: Text(
                'Status: ${r.pddResult.status.friendlyName}' // Friendly status
                '${r.primaryCause != null ? '\nCause: ${r.primaryCause!.level2.friendlyName} (${r.primaryCause!.department.friendlyName})' : ''}', // Friendly cause & dept
              ),
              isThreeLine: true,
            ),
          );
        }).toList(),
      ),
    );
  }
}
