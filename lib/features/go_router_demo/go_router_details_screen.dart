import 'package:flutter/material.dart';

class GoRouterDetailsScreen extends StatelessWidget {
  final String? id;
  final String? source;

  const GoRouterDetailsScreen({
    super.key,
    this.id,
    this.source,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sản phẩm $id')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Thông tin chi tiết',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 24),
            _infoRow('ID sản phẩm', id ?? 'N/A'),
            _infoRow('Nguồn truy cập', source ?? 'Trực tiếp'),
            const Spacer(),
            const Center(
              child: Text(
                'Dữ liệu này được lấy từ URL Query Parameters',
                style: TextStyle(fontStyle: FontStyle.italic, color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(value, style: const TextStyle(color: Colors.blue)),
        ],
      ),
    );
  }
}
