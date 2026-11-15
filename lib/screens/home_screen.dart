import 'package:flutter/material.dart';
import '../theme.dart';
import 'product_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        title: const Text('Scrub Studio', style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.primary)),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_bag_outlined),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Opening Cart...')),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: const TextSpan(
                            style: TextStyle(fontSize: 18, color: AppColors.textDark, fontWeight: FontWeight.bold),
                            children: [
                              TextSpan(text: 'Designed for\n'),
                              TextSpan(text: 'Care.\n', style: TextStyle(color: AppColors.primary)),
                              TextSpan(text: 'Made for You.'),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Premium medical scrubs and lab coats crafted for comfort, style and confidence.',
                          style: TextStyle(fontSize: 11, color: AppColors.textMuted),
                        ),
                        const SizedBox(height: 12),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          ),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (_) => const ProductDetailScreen()),
                            );
                          },
                          child: const Text('SHOP NOW', style: TextStyle(color: Colors.white, fontSize: 12)),
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.people_outline, size: 80, color: AppColors.navy),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Shop by Category', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                TextButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Loading all categories...')),
                    );
                  },
                  child: const Text('See All', style: TextStyle(color: AppColors.primary)),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(child: _buildCategoryCard(context, 'Medical Scrubs', Icons.checkroom)),
                const SizedBox(width: 12),
                Expanded(child: _buildCategoryCard(context, 'Lab Coats', Icons.dry_cleaning)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryCard(BuildContext context, String title, IconData icon) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => const ProductDetailScreen()),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
        child: Column(
          children: [
            Icon(icon, size: 50, color: AppColors.navy),
            const SizedBox(height: 8),
            Text(title, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
          ],
        ),
      ),
    );
  }
}
