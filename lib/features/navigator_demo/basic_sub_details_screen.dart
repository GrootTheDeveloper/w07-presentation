import 'package:flutter/material.dart';

class BasicSubDetailsScreen extends StatelessWidget {
  const BasicSubDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sub-Details (Level 2)'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(Icons.stacked_bar_chart, size: 80, color: Colors.purple),
            const SizedBox(height: 24),
            Text(
              'You are at Level 2!',
              style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            const Text(
              'This is the top-most screen in the Navigator 1.0 backstack right now.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),

            // Stack Visualization widget
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: theme.colorScheme.surfaceVariant,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Text('LIFO Stack Representation', style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  _buildStackItem('[TOP] Level 2: Sub-Details', Colors.purple),
                  const SizedBox(height: 6),
                  _buildStackItem('Level 1: Details Page', Colors.blue),
                  const SizedBox(height: 6),
                  _buildStackItem('[BOTTOM] Home Dashboard', Colors.grey),
                ],
              ),
            ),
            const SizedBox(height: 40),

            OutlinedButton.icon(
              onPressed: () {
                // Pop once to return to Level 1 (Details Page)
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back),
              label: const Text('Pop once (Go to Level 1)'),
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: () {
                // Pop back to root (Home)
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
              icon: const Icon(Icons.home),
              label: const Text('Pop Until First (Go to Home)'),
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.colorScheme.primary,
                foregroundColor: theme.colorScheme.onPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStackItem(String label, Color color) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: color.withAlpha(40),
        border: Border.all(color: color),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: TextStyle(fontWeight: FontWeight.bold, color: color),
        textAlign: TextAlign.center,
      ),
    );
  }
}
