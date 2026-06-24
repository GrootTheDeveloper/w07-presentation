import 'package:demopresent/router/route_names.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ResultDemoScreen extends StatefulWidget {
  const ResultDemoScreen({super.key});

  @override
  State<ResultDemoScreen> createState() => _ResultDemoScreenState();
}

class _ResultDemoScreenState extends State<ResultDemoScreen> {
  String _selectedRole = 'Employee';
  String _selectedColor = 'Blue';
  String _selectedDensity = 'Medium';

  Color _getColor(String colorName) {
    switch (colorName) {
      case 'Red':
        return Colors.red;
      case 'Green':
        return Colors.green;
      case 'Blue':
        return Colors.blue;
      case 'Orange':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  Future<void> _customizeSetting(String type) async {
    // Navigate via GoRouter and wait for return value
    final result = await context.push('${RoutePaths.resultSelection}?type=$type');

    if (result != null && mounted) {
      setState(() {
        if (type == 'role') {
          _selectedRole = result as String;
        } else if (type == 'color') {
          _selectedColor = result as String;
        } else if (type == 'density') {
          _selectedDensity = result as String;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Result Exchange Panel'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          // Informative introduction card
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
                'Navigator pops can pass data back to the calling screen. In GoRouter, this is implemented by awaiting context.push() and handling the returned result.',
                style: TextStyle(fontSize: 12),
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Customizer Dashboard Card
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Profile Customization Panel',
                    style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const Divider(height: 24),

                  // Display Role setting
                  _buildDashboardRow(
                    context: context,
                    label: 'User Role',
                    value: _selectedRole,
                    icon: Icons.admin_panel_settings,
                    color: theme.colorScheme.primary,
                  ),
                  const SizedBox(height: 16),

                  // Display Color setting
                  _buildDashboardRow(
                    context: context,
                    label: 'Accent Color',
                    value: _selectedColor,
                    icon: Icons.palette,
                    color: _getColor(_selectedColor),
                  ),
                  const SizedBox(height: 16),

                  // Display Density setting
                  _buildDashboardRow(
                    context: context,
                    label: 'Display Density',
                    value: _selectedDensity,
                    icon: Icons.density_medium,
                    color: theme.colorScheme.secondary,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 32),

          Text(
            'Launch Selectors',
            style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),

          // Button triggers
          _buildSelectorButton(
            label: 'Change Role Setting',
            icon: Icons.edit_attributes,
            onPressed: () => _customizeSetting('role'),
          ),
          const SizedBox(height: 12),
          _buildSelectorButton(
            label: 'Change Accent Color',
            icon: Icons.color_lens_outlined,
            onPressed: () => _customizeSetting('color'),
          ),
          const SizedBox(height: 12),
          _buildSelectorButton(
            label: 'Change Display Density',
            icon: Icons.view_headline_outlined,
            onPressed: () => _customizeSetting('density'),
          ),
        ],
      ),
    );
  }

  Widget _buildDashboardRow({
    required BuildContext context,
    required String label,
    required String value,
    required IconData icon,
    required Color color,
  }) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withAlpha(30),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: color, size: 20),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: const TextStyle(color: Colors.grey, fontSize: 11)),
            const SizedBox(height: 2),
            Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSelectorButton({
    required String label,
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon),
      label: Text(label),
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
