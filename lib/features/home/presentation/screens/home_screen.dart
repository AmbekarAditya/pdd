import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../reports/ui/widgets/pdd_summary_chart.dart';
import '../../../reports/state/report_provider.dart';
import '../../../train_selection/ui/train_selection_screen.dart';
import '../../../reports/ui/reports_home_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDD Data Entry'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
             _buildDashboard(context, ref),
             const SizedBox(height: 24),
             Expanded(
               child: GridView.count(
                 crossAxisCount: 2,
                 crossAxisSpacing: 16,
                 mainAxisSpacing: 16,
                 children: [
                   _buildNavCard(
                       context,
                       'New Train',
                       Icons.train,
                       Colors.blue,
                       () => _navigateToTrainSelection(context)
                   ),
                    _buildNavCard(
                       context,
                       'Reports',
                       Icons.analytics,
                       Colors.purple,
                       () => _navigateToReports(context)
                   ),
                 ],
               ),
             ),
          ],
        ),
      ),
    );
  }

  Widget _buildDashboard(BuildContext context, WidgetRef ref) {
    final summary = ref.watch(dailySummaryProvider);

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Dashboard',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Today',
                  style: TextStyle(color: Colors.grey[600], fontSize: 14),
                ),
              ],
            ),
            const SizedBox(height: 20),
            PddSummaryChart(summary: summary),
            const SizedBox(height: 20),
            _buildLegend(),
          ],
        ),
      ),
    );
  }

  Widget _buildLegend() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
         _legendItem('On Time', Colors.green),
         _legendItem('At Risk', Colors.orange),
         _legendItem('Delayed', Colors.red),
      ],
    );
  }

  Widget _legendItem(String label, Color color) {
    return Row(
      children: [
        Container(width: 12, height: 12, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
        const SizedBox(width: 8),
        Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
      ],
    );
  }

  Widget _buildNavCard(BuildContext context, String title, IconData icon, Color color, VoidCallback onTap) {
      return Card(
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: InkWell(
              onTap: onTap,
              borderRadius: BorderRadius.circular(16),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                      Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              color: color.withValues(alpha: 0.1),
                              shape: BoxShape.circle,
                          ),
                          child: Icon(icon, size: 40, color: color),
                      ),
                      const SizedBox(height: 16),
                      Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ],
              ),
          ),
      );
  }

  void _navigateToTrainSelection(BuildContext context) {
      // Import needed in file header
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const TrainSelectionScreen()),
      );
  }

  void _navigateToReports(BuildContext context) {
       // Import needed in file header
       Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const ReportsHomeScreen()),
      );
  }
}
