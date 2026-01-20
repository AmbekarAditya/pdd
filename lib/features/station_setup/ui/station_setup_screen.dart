import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../state/station_controller.dart';
import '../model/station_model.dart';

class StationSetupScreen extends ConsumerWidget {
  StationSetupScreen({super.key});

  final _codeController = TextEditingController();
  final _nameController = TextEditingController();
  final _platformController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Station Setup')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _codeController,
              decoration: const InputDecoration(labelText: 'Station Code'),
            ),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Station Name'),
            ),
            TextField(
              controller: _platformController,
              keyboardType: TextInputType.number,
              decoration:
                  const InputDecoration(labelText: 'Default Platform'),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                final station = StationModel(
                  stationCode: _codeController.text.trim(),
                  stationName: _nameController.text.trim(),
                  defaultPlatform:
                      int.tryParse(_platformController.text) ?? 1,
                );

                ref
                    .read(stationControllerProvider.notifier)
                    .configureStation(station);
              },
              child: const Text('Save Station'),
            ),
          ],
        ),
      ),
    );
  }
}
