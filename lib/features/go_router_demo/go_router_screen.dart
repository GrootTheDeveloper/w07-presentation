import 'package:demopresent/router/route_names.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GoRouterScreen extends StatelessWidget {
  const GoRouterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GoRouter Demo')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'GoRouter hỗ trợ URL và Query Parameters giống như Web.',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          _buildItem(
            context,
            'Sản phẩm #101',
            'Mở bằng ID 101',
            () => context.push('${RoutePaths.goRouterDetails}?id=101&source=list'),
          ),
          _buildItem(
            context,
            'Sản phẩm #202',
            'Mở bằng ID 202',
            () => context.push('${RoutePaths.goRouterDetails}?id=202&source=marketing'),
          ),
          const SizedBox(height: 40),
          const Divider(),
          ListTile(
            title: const Text('Reset về Home'),
            subtitle: const Text('Sử dụng context.go() để xóa stack'),
            trailing: const Icon(Icons.refresh),
            onTap: () => context.go(RoutePaths.home),
          ),
        ],
      ),
    );
  }

  Widget _buildItem(BuildContext context, String title, String sub, VoidCallback onTap) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        title: Text(title),
        subtitle: Text(sub),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}
