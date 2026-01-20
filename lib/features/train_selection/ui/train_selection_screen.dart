import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/train_type.dart';
import '../../../core/constants/movement_type.dart';
import '../../../core/constants/loco_type.dart';
import '../state/train_controller.dart';
import '../model/train_model.dart';

class TrainSelectionScreen extends ConsumerStatefulWidget {
  const TrainSelectionScreen({super.key});

  @override
  ConsumerState<TrainSelectionScreen> createState() =>
      _TrainSelectionScreenState();
}

class _TrainSelectionScreenState
    extends ConsumerState<TrainSelectionScreen> {
  final _trainNoController = TextEditingController();

  TrainType _trainType = TrainType.mailExpress;
  MovementType _movementType = MovementType.originating;
  LocoType _locoType = LocoType.wap7;

  DateTime _std = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Train Selection')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            TextField(
              controller: _trainNoController,
              keyboardType: TextInputType.number,
              decoration:
                  const InputDecoration(labelText: 'Train Number'),
            ),

            const SizedBox(height: 12),
            DropdownButtonFormField<TrainType>(
              // ignore: deprecated_member_use
              value: _trainType,
              items: TrainType.values
                  .map((t) => DropdownMenuItem(
                        value: t,
                        child: Text(t.name),
                      ))
                  .toList(),
              onChanged: (v) => setState(() => _trainType = v!),
              decoration: const InputDecoration(labelText: 'Train Type'),
            ),

            const SizedBox(height: 12),
            DropdownButtonFormField<MovementType>(
              // ignore: deprecated_member_use
              value: _movementType,
              items: MovementType.values
                  .map((m) => DropdownMenuItem(
                        value: m,
                        child: Text(m.name),
                      ))
                  .toList(),
              onChanged: (v) => setState(() => _movementType = v!),
              decoration:
                  const InputDecoration(labelText: 'Movement Type'),
            ),

            const SizedBox(height: 12),
            DropdownButtonFormField<LocoType>(
              // ignore: deprecated_member_use
              value: _locoType,
              items: LocoType.values
                  .map((l) => DropdownMenuItem(
                        value: l,
                        child: Text(l.name),
                      ))
                  .toList(),
              onChanged: (v) => setState(() => _locoType = v!),
              decoration: const InputDecoration(labelText: 'Loco Type'),
            ),

            const SizedBox(height: 12),
            ListTile(
              title: Text('STD: ${_std.toLocal()}'),
              trailing: const Icon(Icons.access_time),
              onTap: () async {
                final time = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.fromDateTime(_std),
                );
                if (time != null) {
                  setState(() {
                    _std = DateTime(
                      _std.year,
                      _std.month,
                      _std.day,
                      time.hour,
                      time.minute,
                    );
                  });
                }
              },
            ),

            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                final train = TrainModel(
                  trainNumber: _trainNoController.text.trim(),
                  date: DateTime.now(),
                  scheduledDeparture: _std,
                  trainType: _trainType,
                  movementType: _movementType,
                  locoType: _locoType,
                );

                ref
                    .read(trainControllerProvider.notifier)
                    .startTrainSession(train);
              },
              child: const Text('Start Train'),
            ),
          ],
        ),
      ),
    );
  }
}
