import 'package:flutter/material.dart';
import '../theme.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  String selectedSize = 'M';
  Color selectedColor = AppColors.navy;

  final List<String> sizes = ['XS', 'S', 'M', 'L', 'XL'];
  final List<Color> colors = [AppColors.navy, const Color(0xFF4A5568), const Color(0xFF2F855A), AppColors.primary, Colors.black];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Detail'),
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
              height: 220,
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
              child: const Icon(Icons.checkroom, size: 100, color: AppColors.navy),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Classic V-Neck Scrub Set', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text('SAR 149', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.primary)),
              ],
            ),
            const SizedBox(height: 8),
            const Text('Soft stretch fabric, modern fit, multi-pocket design.', style: TextStyle(color: AppColors.textMuted, fontSize: 12)),
            const SizedBox(height: 16),
            const Text('Color', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(
              children: colors.map((color) {
                return GestureDetector(
                  onTap: () => setState(() => selectedColor = color),
                  child: Container(
                    margin: const EdgeInsets.only(right: 12),
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: selectedColor == color ? AppColors.primary : Colors.transparent, width: 2),
                    ),
                    child: CircleAvatar(backgroundColor: color, radius: 12),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            const Text('Size', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(
              children: sizes.map((size) {
                final isSelected = selectedSize == size;
                return GestureDetector(
                  onTap: () => setState(() => selectedSize = size),
                  child: Container(
                    margin: const EdgeInsets.only(right: 8),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: isSelected ? AppColors.primary : Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(size, style: TextStyle(color: isSelected ? Colors.white : AppColors.textDark, fontWeight: FontWeight.bold)),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Product added to cart!')),
                  );
                },
                child: const Text('ADD TO CART', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
