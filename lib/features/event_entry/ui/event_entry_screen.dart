import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/events.dart';
import '../../../core/utils/ui_extensions.dart';
import '../state/event_controller.dart';
import '../../pdd_calculation/state/pdd_provider.dart';
import '../../pdd_calculation/model/pdd_result_model.dart';
import '../../reports/ui/reports_home_screen.dart';
import '../../train_selection/state/train_controller.dart' as train_controller;


class EventEntryScreen extends ConsumerWidget {
  const EventEntryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(eventControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Event Entry'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () async {
            final confirm = await showDialog<bool>(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Exit Session?'),
                content: const Text('This will cancel the current train session. Are you sure?'),
                actions: [
                  TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Cancel')),
                  TextButton(onPressed: () => Navigator.pop(context, true), child: const Text('Exit')),
                ],
              ),
            );

            if (confirm == true) {
               // Order matters: Reset events first, then train (which triggers nav switch)
               ref.read(eventControllerProvider.notifier).resetEvents();
               ref.read(train_controller.trainControllerProvider.notifier).clearTrainSession();
            }
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.analytics),
            tooltip: 'Reports',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ReportsHomeScreen()),
              );
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildStatusHeader(ref),
          const SizedBox(height: 16),
          ...TrainEventType.values.map((event) {
            final done = state.hasEvent(event);
            final time = state.eventTime(event);

            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Card(
                elevation: done ? 1 : 3,
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  title: Text(
                    event.friendlyName,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: done ? Colors.grey[700] : Colors.black,
                    ),
                  ),
                  subtitle: done ? Text('Recorded: ${time!.toLocal().hour}:${time.minute.toString().padLeft(2, '0')}') : null,
                  trailing: Icon(
                    done ? Icons.check_circle : Icons.circle_outlined,
                    color: done ? Colors.green : Colors.grey,
                    size: 32,
                  ),
                  onTap: done
                      ? null
                      : () async {
                          // Logical Warning Check
                          if (event == TrainEventType.readyToDepart) {
                             if (!state.hasEvent(TrainEventType.primaryExamComplete)) {
                                 ScaffoldMessenger.of(context).showSnackBar(
                                   const SnackBar(
                                      content: Text('Warning: Primary Exam not marked complete yet.'),
                                      backgroundColor: Colors.orange,
                                      duration: Duration(seconds: 2),
                                   ),
                                 );
                             }
                          }
                          
                          final now = DateTime.now();
                          final time = await showTimePicker(
                             context: context,
                             initialTime: TimeOfDay.fromDateTime(now),
                             builder: (context, child) {
                                return MediaQuery(
                                  data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
                                  child: child!,
                                );
                             },
                          );

                          if (time != null) {
                             final eventTime = DateTime(
                               now.year,
                               now.month,
                               now.day,
                               time.hour,
                               time.minute,
                             );

                             ref
                              .read(eventControllerProvider.notifier)
                              .recordEvent(event, eventTime);
                          }
                        },
                ),
              ),
            );
          }),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ReportsHomeScreen()),
              );
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
              backgroundColor: Theme.of(context).primaryColor,
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.check_circle_outline),
            label: const Text('SUBMIT & VIEW RECORDS', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildStatusHeader(WidgetRef ref) {
    final pdd = ref.watch(pddProvider);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: pdd.status == PDDStatus.pdd
            ? Colors.red.shade100
            : pdd.status == PDDStatus.atRisk
                ? Colors.orange.shade100
                : Colors.green.shade100,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
           color: pdd.status == PDDStatus.pdd
            ? Colors.red.shade300
            : pdd.status == PDDStatus.atRisk
                ? Colors.orange.shade300
                : Colors.green.shade300,
           width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Status: ${pdd.status.friendlyName.toUpperCase()}',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          if (pdd.hasPDD) 
            Text(
              '${pdd.pddDuration.inMinutes} MIN',
               style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 18, color: Colors.red),
            ),
        ],
      ),
    );
  }
}
