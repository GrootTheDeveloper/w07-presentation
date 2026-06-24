import 'package:demopresent/router/route_names.dart';
import 'package:demopresent/shared/models/demo_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final demos = [
      const DemoItem(
        title: 'Basic Navigator',
        description: 'Demo push and pop using Navigator 1.0',
        route: RoutePaths.navigatorBasic,
        icon: Icons.navigation_outlined,
      ),
      const DemoItem(
        title: 'Named Routes',
        description: 'Navigate using defined route names and passing arguments',
        route: RoutePaths.namedRoute,
        icon: Icons.label_important_outline,
      ),
      const DemoItem(
        title: 'GoRouter (Declarative)',
        description: 'Modern routing with query params and deep linking',
        route: RoutePaths.goRouterDemo,
        icon: Icons.route_outlined,
      ),
      const DemoItem(
        title: 'Return Result',
        description: 'Get data back from the previous screen',
        route: RoutePaths.resultDemo,
        icon: Icons.assignment_return_outlined,
      ),
      const DemoItem(
        title: 'Auth Redirect',
        description: 'Simulate protected routes and login flow',
        route: RoutePaths.profile,
        icon: Icons.lock_outline,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Routing Demo'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemCount: demos.length,
        itemBuilder: (context, index) {
          final item = demos[index];
          return Card(
            child: ListTile(
              leading: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  shape: BoxShape.circle,
                ),
                child: Icon(item.icon, color: Theme.of(context).colorScheme.primary),
              ),
              title: Text(
                item.title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(item.description),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                context.push(item.route);
              },
            ),
          );
        },
      ),
    );
  }
}
