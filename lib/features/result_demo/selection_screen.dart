import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SelectionScreen extends StatelessWidget {
  const SelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = [
      {'name': 'Đỏ', 'color': Colors.red},
      {'name': 'Xanh lá', 'color': Colors.green},
      {'name': 'Xanh dương', 'color': Colors.blue},
      {'name': 'Vàng', 'color': Colors.orange},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Chọn một màu')),
      body: ListView.separated(
        itemCount: colors.length,
        separatorBuilder: (context, index) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final colorItem = colors[index];
          return ListTile(
            leading: CircleAvatar(backgroundColor: colorItem['color'] as Color),
            title: Text(colorItem['name'] as String),
            onTap: () => context.pop(colorItem['name']),
            trailing: const Icon(Icons.arrow_right),
          );
        },
      ),
    );
  }
}
