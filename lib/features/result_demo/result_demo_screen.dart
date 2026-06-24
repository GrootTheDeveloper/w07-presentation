import 'package:demopresent/router/route_names.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ResultDemoScreen extends StatefulWidget {
  const ResultDemoScreen({super.key});

  @override
  State<ResultDemoScreen> createState() => _ResultDemoScreenState();
}

class _ResultDemoScreenState extends State<ResultDemoScreen> {
  String _selectedOption = 'Chưa chọn';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nhận kết quả trả về')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Màu sắc bạn đã chọn là:'),
              const SizedBox(height: 16),
              Text(
                _selectedOption,
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: _getColorFromName(_selectedOption),
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 60),
              ElevatedButton.icon(
                onPressed: () async {
                  final result = await context.push(RoutePaths.resultSelection);
                  if (result != null && mounted) {
                    setState(() {
                      _selectedOption = result as String;
                    });
                  }
                },
                icon: const Icon(Icons.palette),
                label: const Text('Mở bảng chọn màu'),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getColorFromName(String name) {
    switch (name) {
      case 'Đỏ': return Colors.red;
      case 'Xanh lá': return Colors.green;
      case 'Xanh dương': return Colors.blue;
      case 'Vàng': return Colors.orange;
      default: return Colors.black;
    }
  }
}
