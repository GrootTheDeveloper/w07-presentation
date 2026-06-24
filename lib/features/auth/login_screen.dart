import 'package:demopresent/features/auth/auth_controller.dart';
import 'package:demopresent/shared/widgets/explanation_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login Mock')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const ExplanationCard(
              title: 'Auth Redirect',
              explanation:
                  'GoRouter can automatically redirect users based on application state (e.g., authentication).',
              codeSnippets: [
                "redirect: (context, state) {\n  if (!isLoggedIn) return '/login';\n  return null;\n}",
              ],
            ),
            const Spacer(),
            const Icon(Icons.lock_person_outlined, size: 80, color: Colors.grey),
            const SizedBox(height: 16),
            const Text(
              'You need to login to access the Profile page.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ref.read(authProvider.notifier).login();
                },
                child: const Text('Login (Simulate)'),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
