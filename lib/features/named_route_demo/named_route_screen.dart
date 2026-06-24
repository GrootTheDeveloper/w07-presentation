import 'package:demopresent/router/route_names.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NamedRouteScreen extends StatefulWidget {
  const NamedRouteScreen({super.key});

  @override
  State<NamedRouteScreen> createState() => _NamedRouteScreenState();
}

class _NamedRouteScreenState extends State<NamedRouteScreen> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: 'Chào từ Home!');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _submit() {
    final text = _controller.text.trim();
    if (text.isNotEmpty) {
      context.pushNamed(RouteNames.namedDetails, extra: text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Named Routes')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Card(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Điều hướng bằng Tên giúp code gọn gàng hơn và không cần import trực tiếp file màn hình.',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const Spacer(),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Nhập tin nhắn gửi đi',
                border: OutlineInputBorder(),
              ),
              onSubmitted: (_) => _submit(),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _submit,
              child: const Text('Gửi dữ liệu sang Details'),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
