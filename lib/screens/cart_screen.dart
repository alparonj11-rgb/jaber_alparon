import 'package:flutter/material.dart';
import '../theme.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Cart')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  _buildCartItem(context, 'Classic V-Neck Scrub Set', 'Navy Blue', 'M', 'SAR 149'),
                  const SizedBox(height: 12),
                  _buildCartItem(context, 'Premium Lab Coat', 'White', 'M', 'SAR 139'),
                ],
              ),
            ),
            const Divider(),
            _buildSummaryRow('Subtotal', 'SAR 288'),
            _buildSummaryRow('Shipping', 'SAR 20'),
            const SizedBox(height: 8),
            _buildSummaryRow('Total', 'SAR 308', isTotal: true),
            const SizedBox(height: 16),
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
                    const SnackBar(content: Text('Proceeding to checkout...')),
                  );
                },
                child: const Text('CHECKOUT', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCartItem(BuildContext context, String title, String color, String size, String price) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          Container(width: 50, height: 50, color: Colors.grey[200], child: const Icon(Icons.shopping_bag, color: AppColors.navy)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                Text('Color: $color | Size: $size', style: const TextStyle(color: AppColors.textMuted, fontSize: 11)),
                const SizedBox(height: 4),
                Text(price, style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.primary, fontSize: 12)),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.delete_outline, color: Colors.grey),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Removed $title from cart')),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontWeight: isTotal ? FontWeight.bold : FontWeight.normal, fontSize: isTotal ? 15 : 13)),
          Text(value, style: TextStyle(fontWeight: isTotal ? FontWeight.bold : FontWeight.normal, fontSize: isTotal ? 15 : 13, color: isTotal ? AppColors.primary : AppColors.textDark)),
        ],
      ),
    );
  }
}
