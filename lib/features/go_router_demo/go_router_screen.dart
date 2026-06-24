import 'package:demopresent/router/route_names.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GoRouterScreen extends StatefulWidget {
  const GoRouterScreen({super.key});

  @override
  State<GoRouterScreen> createState() => _GoRouterScreenState();
}

class _GoRouterScreenState extends State<GoRouterScreen> {
  final _searchController = TextEditingController();
  String _selectedCategory = 'All';

  final List<Map<String, dynamic>> _allProducts = [
    {
      'id': '101',
      'name': 'Premium Laptop Pro',
      'category': 'Electronics',
      'price': 1499.00,
      'icon': Icons.laptop,
    },
    {
      'id': '202',
      'name': 'Flagship Smartphone',
      'category': 'Electronics',
      'price': 999.00,
      'icon': Icons.phone_android,
    },
    {
      'id': '303',
      'name': 'Mechanical Gaming Keyboard',
      'category': 'Accessories',
      'price': 120.00,
      'icon': Icons.keyboard,
    },
    {
      'id': '404',
      'name': 'Wireless Noise Canceling Headphones',
      'category': 'Accessories',
      'price': 299.00,
      'icon': Icons.headphones,
    },
    {
      'id': '505',
      'name': 'Smart Watch Series 9',
      'category': 'Electronics',
      'price': 399.00,
      'icon': Icons.watch,
    },
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Filter products
    final filteredProducts = _allProducts.where((p) {
      final matchesSearch = p['name'].toString().toLowerCase().contains(_searchController.text.toLowerCase());
      final matchesCategory = _selectedCategory == 'All' || p['category'] == _selectedCategory;
      return matchesSearch && matchesCategory;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('GoRouter Store Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Search and Category Selector
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search Products',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    _searchController.clear();
                    setState(() {});
                  },
                ),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
              ),
              onChanged: (_) => setState(() {}),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const Text('Category: ', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(width: 8),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ChoiceChip(
                          label: const Text('All'),
                          selected: _selectedCategory == 'All',
                          onSelected: (_) => setState(() => _selectedCategory = 'All'),
                        ),
                        const SizedBox(width: 8),
                        ChoiceChip(
                          label: const Text('Electronics'),
                          selected: _selectedCategory == 'Electronics',
                          onSelected: (_) => setState(() => _selectedCategory = 'Electronics'),
                        ),
                        const SizedBox(width: 8),
                        ChoiceChip(
                          label: const Text('Accessories'),
                          selected: _selectedCategory == 'Accessories',
                          onSelected: (_) => setState(() => _selectedCategory = 'Accessories'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Products list
            Expanded(
              child: filteredProducts.isEmpty
                  ? const Center(child: Text('No products found.'))
                  : ListView.builder(
                      itemCount: filteredProducts.length,
                      itemBuilder: (context, index) {
                        final product = filteredProducts[index];
                        return Card(
                          margin: const EdgeInsets.only(bottom: 12),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: theme.colorScheme.primaryContainer,
                              child: Icon(product['icon'] as IconData, color: theme.colorScheme.primary),
                            ),
                            title: Text(
                              product['name'] as String,
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text('\$${(product['price'] as double).toStringAsFixed(2)} • ${product['category']}'),
                            trailing: const Icon(Icons.chevron_right),
                            onTap: () {
                              // Build dynamic query parameters
                              final id = product['id'];
                              final name = Uri.encodeComponent(product['name'] as String);
                              final price = product['price'].toString();
                              final category = product['category'];

                              context.push(
                                '${RoutePaths.goRouterDetails}?id=$id&name=$name&price=$price&category=$category&source=store_grid',
                              );
                            },
                          ),
                        );
                      },
                    ),
            ),
            const Divider(),
            ListTile(
              title: const Text('Reset to Home'),
              subtitle: const Text('Uses context.go() to clear stack history'),
              trailing: const Icon(Icons.refresh),
              onTap: () => context.go(RoutePaths.home),
            ),
          ],
        ),
      ),
    );
  }
}
