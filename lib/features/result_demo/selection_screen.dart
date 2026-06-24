import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SelectionScreen extends StatelessWidget {
  final String type;

  const SelectionScreen({super.key, this.type = 'color'});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> options = [];

    if (type == 'role') {
      options = [
        {'name': 'Finance Manager', 'icon': Icons.admin_panel_settings, 'value': 'Manager'},
        {'name': 'Business Employee', 'icon': Icons.badge_outlined, 'value': 'Employee'},
        {'name': 'Guest Viewer', 'icon': Icons.remove_red_eye_outlined, 'value': 'Guest'},
      ];
    } else if (type == 'color') {
      options = [
        {'name': 'Crimson Red', 'icon': Icons.palette, 'value': 'Red', 'color': Colors.red},
        {'name': 'Emerald Green', 'icon': Icons.palette, 'value': 'Green', 'color': Colors.green},
        {'name': 'Royal Blue', 'icon': Icons.palette, 'value': 'Blue', 'color': Colors.blue},
        {'name': 'Amber Orange', 'icon': Icons.palette, 'value': 'Orange', 'color': Colors.orange},
      ];
    } else if (type == 'density') {
      options = [
        {'name': 'High Density (Compact)', 'icon': Icons.density_small, 'value': 'High'},
        {'name': 'Medium Density (Comfortable)', 'icon': Icons.density_medium, 'value': 'Medium'},
        {'name': 'Low Density (Loose)', 'icon': Icons.density_large, 'value': 'Low'},
      ];
    }

    final String title = type == 'role'
        ? 'Select Profile Role'
        : type == 'color'
            ? 'Select Accent Color'
            : 'Select Display Density';

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.separated(
        itemCount: options.length,
        separatorBuilder: (context, index) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final opt = options[index];
          final leadingWidget = type == 'color'
              ? CircleAvatar(backgroundColor: opt['color'] as Color, radius: 14)
              : Icon(opt['icon'] as IconData);

          return ListTile(
            leading: leadingWidget,
            title: Text(opt['name'] as String),
            onTap: () {
              // Return chosen value to result awaiter
              context.pop(opt['value'] as String);
            },
            trailing: const Icon(Icons.arrow_forward_ios, size: 14),
          );
        },
      ),
    );
  }
}
