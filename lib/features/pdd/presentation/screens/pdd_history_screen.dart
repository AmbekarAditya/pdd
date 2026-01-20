import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controllers/pdd_list_controller.dart';
import '../widgets/pdd_record_card.dart';
import 'pdd_entry_screen.dart';

class PddHistoryScreen extends ConsumerWidget {
  const PddHistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncList = ref.watch(pddListControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('PDD History'),
      ),
      body: asyncList.when(
        data: (records) {
          if (records.isEmpty) {
            return const Center(child: Text('No records found. Tap + to add.'));
          }
          return ListView.builder(
            itemCount: records.length,
            itemBuilder: (context, index) {
              final record = records[index];
              return PddRecordCard(record: record);
            },
          );
        },
        error: (err, stack) => Center(child: Text('Error: $err')),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const PddEntryScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
