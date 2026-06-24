import 'package:demopresent/features/navigator_demo/basic_details_screen.dart';
import 'package:flutter/material.dart';

class NavigatorBasicScreen extends StatelessWidget {
  const NavigatorBasicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Navigator 1.0')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.layers_outlined, size: 100, color: Colors.blue),
            const SizedBox(height: 24),
            const Text(
              'Đây là demo về Navigator.push cơ bản',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const BasicDetailsScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.arrow_forward),
              label: const Text('Mở màn hình chi tiết'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
