import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/pdd_record.dart';
import '../controllers/pdd_list_controller.dart';

import '../../domain/logic/delay_analyzer.dart';

class PddRecordCard extends ConsumerWidget {
  final PddRecord record;

  const PddRecordCard({super.key, required this.record});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final validationErrors = DelayAnalyzer.analyze(record);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                '${record.trainNo} - ${record.trainType.label}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  Text('Movement: ${record.movementType.label}'),
                  const SizedBox(height: 4),
                  if (record.isDelayed)
                    Text(
                      'PDD: ${record.pdd!.inMinutes} mins',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.error,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    )
                  else if (record.pdd != null)
                    const Text('On Time', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold))
                  else
                    const Text('Incomplete Data'),
                ],
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete_outline),
                onPressed: () {
                  ref.read(pddListControllerProvider.notifier).deleteRecord(record.id);
                },
              ),
            ),
            if (validationErrors.isNotEmpty) ...[
              const Divider(),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Potential Causes:',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.tertiary,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
              ),
              const SizedBox(height: 4),
              ...validationErrors.map((cause) => Padding(
                    padding: const EdgeInsets.only(bottom: 2.0),
                    child: Row(
                      children: [
                        Icon(Icons.warning_amber_rounded,
                            size: 14, color: Theme.of(context).colorScheme.tertiary),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            cause,
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onSurfaceVariant,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
            ]
          ],
        ),
      ),
    );
  }
}
