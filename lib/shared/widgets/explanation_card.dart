import 'package:flutter/material.dart';

class ExplanationCard extends StatelessWidget {
  final String title;
  final String explanation;
  final List<String> codeSnippets; // Kept for compatibility but will be ignored or simplified

  const ExplanationCard({
    super.key,
    required this.title,
    required this.explanation,
    this.codeSnippets = const [],
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Theme.of(context).colorScheme.secondaryContainer.withAlpha(50),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8),
            Text(explanation),
          ],
        ),
      ),
    );
  }
}
