import 'package:demopresent/features/named_route_demo/feedback_model.dart';
import 'package:demopresent/router/route_names.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NamedRouteScreen extends StatefulWidget {
  const NamedRouteScreen({super.key});

  @override
  State<NamedRouteScreen> createState() => _NamedRouteScreenState();
}

class _NamedRouteScreenState extends State<NamedRouteScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController(text: 'Dung Nguyen');
  final _commentsController = TextEditingController(text: 'This navigation framework feels extremely structured!');
  int _selectedRating = 5;

  @override
  void dispose() {
    _nameController.dispose();
    _commentsController.dispose();
    super.dispose();
  }

  void _submitFeedback() {
    if (_formKey.currentState?.validate() ?? false) {
      final feedback = FeedbackModel(
        userName: _nameController.text.trim(),
        rating: _selectedRating,
        comments: _commentsController.text.trim(),
      );

      // Navigate using GoRouter's pushNamed, passing custom object through extra
      context.pushNamed(RouteNames.namedDetails, extra: feedback);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Named Routes Form'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(20.0),
          children: [
            // Educational Card
            Card(
              color: theme.colorScheme.secondaryContainer.withAlpha(50),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: theme.colorScheme.secondary.withAlpha(50)),
              ),
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Named Routes allow pushing pages by unique semantic identifiers (RouteNames) and passing custom complex objects (like custom Dart classes) securely using GoRouter\'s extra parameter.',
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // User Name Input
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Your Name',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            // Rating Dropdown
            DropdownButtonFormField<int>(
              value: _selectedRating,
              decoration: const InputDecoration(
                labelText: 'App Experience Rating',
                prefixIcon: Icon(Icons.star),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
              ),
              items: const [
                DropdownMenuItem(value: 5, child: Text('5 Stars - Excellent')),
                DropdownMenuItem(value: 4, child: Text('4 Stars - Very Good')),
                DropdownMenuItem(value: 3, child: Text('3 Stars - Good')),
                DropdownMenuItem(value: 2, child: Text('2 Stars - Fair')),
                DropdownMenuItem(value: 1, child: Text('1 Star - Poor')),
              ],
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    _selectedRating = value;
                  });
                }
              },
            ),
            const SizedBox(height: 16),

            // Comments input
            TextFormField(
              controller: _commentsController,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: 'Experience Comments',
                prefixIcon: Icon(Icons.comment),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
              ),
            ),
            const SizedBox(height: 32),

            ElevatedButton.icon(
              onPressed: _submitFeedback,
              icon: const Icon(Icons.send),
              label: const Text('Submit and Pass Object'),
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.colorScheme.primary,
                foregroundColor: theme.colorScheme.onPrimary,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
