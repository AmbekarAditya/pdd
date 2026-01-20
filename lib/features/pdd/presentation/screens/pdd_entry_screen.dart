import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../../../../core/domain/enums/train_type.dart';
import '../../../../core/domain/enums/movement_type.dart';
import '../../../../core/domain/enums/loco_type.dart';
import '../../domain/entities/pdd_record.dart';
import '../controllers/pdd_list_controller.dart';
import '../widgets/timestamp_input_field.dart';

class PddEntryScreen extends ConsumerStatefulWidget {
  const PddEntryScreen({super.key});

  @override
  ConsumerState<PddEntryScreen> createState() => _PddEntryScreenState();
}

class _PddEntryScreenState extends ConsumerState<PddEntryScreen> {
  final _formKey = GlobalKey<FormState>();
  final _trainNoController = TextEditingController();
  
  // Form State
  TrainType _selectedTrainType = TrainType.mailExpress; // Default
  MovementType _selectedMovementType = MovementType.originating; // Default
  LocoType? _selectedLocoType;
  
  DateTime? _rakeArrived;
  DateTime? _locoAttached;
  DateTime? _examStart;
  DateTime? _examComplete;
  DateTime? _brakePowerOk;
  DateTime? _crewReported;
  DateTime? _readyToDepart;
  DateTime? _scheduledDeparture;
  DateTime? _actualDeparture;

  @override
  void dispose() {
    _trainNoController.dispose();
    super.dispose();
  }

  void _save() {
    if (_formKey.currentState!.validate()) {
      final record = PddRecord(
        id: const Uuid().v4(),
        trainNo: _trainNoController.text,
        trainType: _selectedTrainType,
        movementType: _selectedMovementType,
        locoType: _selectedLocoType,
        rakeArrived: _rakeArrived,
        locoAttached: _locoAttached,
        examStart: _examStart,
        examComplete: _examComplete,
        brakePowerOk: _brakePowerOk,
        crewReported: _crewReported,
        readyToDepart: _readyToDepart,
        scheduledDeparture: _scheduledDeparture,
        actualDeparture: _actualDeparture,
      );

      ref.read(pddListControllerProvider.notifier).addRecord(record);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add PDD Record'),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: _save,
          )
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Core Info
            TextFormField(
              controller: _trainNoController,
              decoration: const InputDecoration(labelText: 'Train No'),
              keyboardType: TextInputType.number,
              validator: (v) => v == null || v.isEmpty ? 'Required' : null,
            ),
            const SizedBox(height: 16),
            
            // Enums
            DropdownButtonFormField<TrainType>(
              // ignore: deprecated_member_use
              value: _selectedTrainType,
              decoration: const InputDecoration(labelText: 'Train Type'),
              items: TrainType.values.map((e) => DropdownMenuItem(value: e, child: Text(e.label))).toList(),
              onChanged: (v) => setState(() => _selectedTrainType = v!),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<MovementType>(
              // ignore: deprecated_member_use
              value: _selectedMovementType,
              decoration: const InputDecoration(labelText: 'Movement Type'),
              items: MovementType.values.map((e) => DropdownMenuItem(value: e, child: Text(e.label))).toList(),
              onChanged: (v) => setState(() => _selectedMovementType = v!),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<LocoType>(
              // ignore: deprecated_member_use
              value: _selectedLocoType,
              decoration: const InputDecoration(labelText: 'Loco Type (Optional)'),
              items: LocoType.values.map((e) => DropdownMenuItem(value: e, child: Text(e.label))).toList(),
              onChanged: (v) => setState(() => _selectedLocoType = v),
            ),
            
            const Divider(height: 32),
            const Text('Timestamps', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),

            // Timestamps
            TimestampInputField(
              label: 'Scheduled Dept (STD)',
              value: _scheduledDeparture,
              onChanged: (val) => setState(() => _scheduledDeparture = val),
              onClear: () => setState(() => _scheduledDeparture = null),
            ),
            TimestampInputField(
              label: 'Ready to Depart',
              value: _readyToDepart,
              onChanged: (val) => setState(() => _readyToDepart = val),
              onClear: () => setState(() => _readyToDepart = null),
            ),
             TimestampInputField(
              label: 'Actual Departure',
              value: _actualDeparture,
              onChanged: (val) => setState(() => _actualDeparture = val),
              onClear: () => setState(() => _actualDeparture = null),
            ),
            const Divider(),
            TimestampInputField(
              label: 'Rake Arrived',
              value: _rakeArrived,
              onChanged: (val) => setState(() => _rakeArrived = val),
              onClear: () => setState(() => _rakeArrived = null),
            ),
            TimestampInputField(
              label: 'Loco Attached',
              value: _locoAttached,
              onChanged: (val) => setState(() => _locoAttached = val),
              onClear: () => setState(() => _locoAttached = null),
            ),
            TimestampInputField(
              label: 'Exam Start',
              value: _examStart,
              onChanged: (val) => setState(() => _examStart = val),
              onClear: () => setState(() => _examStart = null),
            ),
            TimestampInputField(
              label: 'Exam Complete',
              value: _examComplete,
              onChanged: (val) => setState(() => _examComplete = val),
              onClear: () => setState(() => _examComplete = null),
            ),
            TimestampInputField(
              label: 'Brake Power OK',
              value: _brakePowerOk,
              onChanged: (val) => setState(() => _brakePowerOk = val),
              onClear: () => setState(() => _brakePowerOk = null),
            ),
            TimestampInputField(
              label: 'Crew Reported',
              value: _crewReported,
              onChanged: (val) => setState(() => _crewReported = val),
              onClear: () => setState(() => _crewReported = null),
            ),

            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: _save,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
              ),
              child: const Text('SAVE RECORD'),
            ),
          ],
        ),
      ),
    );
  }
}
