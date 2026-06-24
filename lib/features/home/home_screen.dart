import 'package:demopresent/router/route_names.dart';
import 'package:demopresent/shared/models/demo_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _deepLinkController = TextEditingController(text: '/go-router-details?id=789&source=quick_test');

  @override
  void dispose() {
    _deepLinkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final demos = [
      const DemoItem(
        title: 'Basic Navigator',
        description: 'Navigator 1.0 stack push/pop & visual stack monitor',
        route: RoutePaths.navigatorBasic,
        icon: Icons.navigation_outlined,
      ),
      const DemoItem(
        title: 'Named Routes',
        description: 'Navigate using names and pass a structured custom object',
        route: RoutePaths.namedRoute,
        icon: Icons.label_important_outline,
      ),
      const DemoItem(
        title: 'GoRouter Params',
        description: 'URL-based routing with dynamic query/path parameters',
        route: RoutePaths.goRouterDemo,
        icon: Icons.route_outlined,
      ),
      const DemoItem(
        title: 'Return Result',
        description: 'Push a screen and wait for data back from a pop',
        route: RoutePaths.resultDemo,
        icon: Icons.assignment_return_outlined,
      ),
      const DemoItem(
        title: 'Auth Redirect',
        description: 'Simulate role-based access control and router redirects',
        route: RoutePaths.profile,
        icon: Icons.lock_outline,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation & Routing Lab'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Header introduction card
          Card(
            color: theme.colorScheme.primaryContainer.withAlpha(50),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(color: theme.colorScheme.primary.withAlpha(80)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Explore Navigation Patterns',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'This workspace demonstrates standard Flutter Navigator 1.0 (imperative stack) and modern GoRouter 2.0 (declarative, URL-driven routing) side-by-side.',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),

          Text(
            'Interactive Demos',
            style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),

          // List of demos
          ...demos.map((item) {
            return Card(
              margin: const EdgeInsets.only(bottom: 12),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primaryContainer,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(item.icon, color: theme.colorScheme.primary),
                ),
                title: Text(
                  item.title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(item.description, style: const TextStyle(fontSize: 12)),
                trailing: const Icon(Icons.arrow_forward_ios, size: 14),
                onTap: () => context.push(item.route),
              ),
            );
          }),
          const SizedBox(height: 24),

          // Deep Link Tester Widget
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.link, color: theme.colorScheme.primary),
                      const SizedBox(width: 8),
                      Text(
                        'Deep Link / Router Tester',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Manually test GoRouter\'s path matching and query parameter parsing below.',
                    style: TextStyle(color: Colors.grey, fontSize: 11),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _deepLinkController,
                    decoration: const InputDecoration(
                      labelText: 'Simulated Route / Link',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        final path = _deepLinkController.text.trim();
                        if (path.isNotEmpty) {
                          try {
                            context.push(path);
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Error launching path: $e'),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        }
                      },
                      icon: const Icon(Icons.bolt),
                      label: const Text('Launch Route'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme.colorScheme.primary,
                        foregroundColor: theme.colorScheme.onPrimary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
