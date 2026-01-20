import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/utils/ui_extensions.dart'; // Import extensions
import '../state/delay_cause_provider.dart';

class DelayReasonScreen extends ConsumerWidget {
  const DelayReasonScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final causes = ref.watch(delayCauseProvider);

    if (causes.isEmpty) {
      return const Scaffold(
        body: Center(child: Text("No delays detected or logic error.")),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Delay Cause Summary'),
        automaticallyImplyLeading: false, 
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: causes.map((cause) {
          return Card(
            color: cause.isPrimary
                ? Colors.red.shade100
                : Colors.orange.shade100,
            child: ListTile(
              title: Text(
                cause.level2.friendlyName, // Friendly level 2
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'Dept: ${cause.department.friendlyName}' // Friendly dept
                '${cause.isPrimary ? ' (PRIMARY)' : ''}',
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
