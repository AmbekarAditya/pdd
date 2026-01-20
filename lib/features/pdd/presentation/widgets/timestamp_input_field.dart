import 'package:flutter/material.dart';

class TimestampInputField extends StatelessWidget {
  final String label;
  final DateTime? value;
  final ValueChanged<DateTime> onChanged;
  final VoidCallback onClear;

  const TimestampInputField({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
    required this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
          const SizedBox(width: 8),
          if (value != null) ...[
            Text(
              '${value!.hour.toString().padLeft(2, '0')}:${value!.minute.toString().padLeft(2, '0')}',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            IconButton(
              icon: const Icon(Icons.clear, size: 20),
              onPressed: onClear,
            ),
          ],
          ElevatedButton(
            onPressed: () async {
              final TimeOfDay? picked = await showTimePicker(
                context: context,
                initialTime: value != null
                    ? TimeOfDay.fromDateTime(value!)
                    : TimeOfDay.now(),
              );
              if (picked != null) {
                final now = DateTime.now();
                // Simple assumption: Event is today.
                // In a real app, we'd pick date too, but prompt said "tap-to-record timestamps" implied mostly real-time or simpler. 
                // We will use current date + picked time.
                final dateTime = DateTime(
                  now.year,
                  now.month,
                  now.day,
                  picked.hour,
                  picked.minute,
                );
                onChanged(dateTime);
              }
            },
            child: Text(value == null ? 'Set Time' : 'Edit'),
          ),
        ],
      ),
    );
  }
}
