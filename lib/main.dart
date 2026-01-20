import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'core/theme/app_theme.dart';
import 'data/hive/hive_init.dart';
import 'data/hive/hive_boxes.dart';
import 'data/adapters/station_adapter.dart';
import 'data/adapters/train_adapter.dart';
import 'data/adapters/event_adapter.dart';

import 'features/station_setup/state/station_controller.dart';
import 'features/station_setup/ui/station_setup_screen.dart';
import 'features/train_selection/state/train_controller.dart';
import 'features/train_selection/ui/train_selection_screen.dart';
import 'features/event_entry/ui/event_entry_screen.dart';

import 'features/pdd_calculation/state/pdd_provider.dart';
import 'features/pdd_calculation/model/pdd_result_model.dart';
// ignore: unused_import
import 'features/event_entry/state/event_controller.dart'; 
import 'core/constants/events.dart';
import 'features/delay_reason/ui/delay_reason_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initHive();

  Hive.registerAdapter(StationHiveModelAdapter());
  Hive.registerAdapter(TrainHiveModelAdapter());
  Hive.registerAdapter(EventHiveModelAdapter());

  await Hive.openBox<StationHiveModel>(HiveBoxes.station);
  await Hive.openBox<TrainHiveModel>(HiveBoxes.train);
  await Hive.openBox<EventHiveModel>(HiveBoxes.events);

  // Track 3: Failure Safety
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    // Log error to console or future audit log
  };

  ErrorWidget.builder = (FlutterErrorDetails details) {
    return Material(
       child: Container(
         color: Colors.white,
         padding: const EdgeInsets.all(16),
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             const Icon(Icons.error_outline, color: Colors.red, size: 48),
             const SizedBox(height: 16),
             const Text(
               'Something went wrong.',
               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
             ),
             const SizedBox(height: 8),
             const Text(
               'Please restart the app. Status is preserved.',
               textAlign: TextAlign.center,
             ),
             const SizedBox(height: 8),
             Text(details.exception.toString(), style: const TextStyle(color: Colors.grey, fontSize: 12)),
           ],
         ),
       ),
    );
  };

  runApp(const ProviderScope(child: PddApp()));
}


class PddApp extends ConsumerWidget {
  const PddApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stationState = ref.watch(stationControllerProvider);
    final trainState = ref.watch(trainControllerProvider);
    
    // Check if we should show Delay Screen
    // We need to watch pddProvider, but pddProvider depends on trainState.
    // If no train, pdd is safe.
    final pdd = ref.watch(pddProvider);
    final eventState = ref.watch(eventControllerProvider);
    
    // Logic: 
    // 1. Station Configured? No -> StationSetup
    // 2. Active Train? No -> TrainSelection
    // 3. Ready to Depart recorded AND PDD exists? -> DelayReasonScreen
    // 4. Else -> EventEntryScreen

    Widget homeWidget;

    if (!stationState.isConfigured) {
      homeWidget = StationSetupScreen();
    } else if (!trainState.hasActiveTrain) {
      homeWidget = const TrainSelectionScreen();
    } else {
      // We have active train. Check if complete and PDD.
      final isReady = eventState.hasEvent(TrainEventType.readyToDepart);
      if (isReady && pdd.status == PDDStatus.pdd) {
        homeWidget = const DelayReasonScreen();
      } else {
        homeWidget = const EventEntryScreen();
      }
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PDD App',
      theme: AppTheme.lightTheme,
      home: homeWidget,
    );
  }
}
