import 'package:flutter/material.dart';
import '../theme.dart';

class CustomizeScreen extends StatefulWidget {
  const CustomizeScreen({super.key});

  @override
  State<CustomizeScreen> createState() => _CustomizeScreenState();
}

class _CustomizeScreenState extends State<CustomizeScreen> {
  int selectedTab = 0;

  // Customization State
  Color selectedColor = AppColors.navy;
  String selectedStyle = 'Classic Fit';
  String selectedSize = 'M';
  final TextEditingController _embroideryController = TextEditingController();

  final List<Color> colors = [AppColors.navy, const Color(0xFF4A5568), const Color(0xFF2F855A), AppColors.primary, Colors.black];
  final List<String> styles = ['Slim Fit', 'Classic Fit', 'Athletic Fit'];
  final List<String> sizes = ['XS', 'S', 'M', 'L', 'XL'];

  @override
  void dispose() {
    _embroideryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Customize Your Scrub')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
              child: const Icon(Icons.design_services, size: 80, color: AppColors.navy),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                _buildTab('Color', 0),
                _buildTab('Embroidery', 1),
                _buildTab('Style', 2),
                _buildTab('Size', 3),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: _buildTabContent(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabContent() {
    switch (selectedTab) {
      case 0:
        return _buildColorTab();
      case 1:
        return _buildEmbroideryTab();
      case 2:
        return _buildStyleTab();
      case 3:
        return _buildSizeTab();
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildColorTab() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Select Color', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        const SizedBox(height: 12),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: colors.map((color) {
            return GestureDetector(
              onTap: () => setState(() => selectedColor = color),
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: selectedColor == color ? AppColors.primary : Colors.transparent,
                    width: 2,
                  ),
                ),
                child: CircleAvatar(backgroundColor: color, radius: 15),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildEmbroideryTab() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Add Embroidery', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _embroideryController,
                decoration: InputDecoration(
                  hintText: 'e.g. Dr. Name',
                  fillColor: Colors.white,
                  filled: true,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
              onPressed: () {
                // Handle embroidery addition
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Added embroidery: ${_embroideryController.text}')),
                );
              },
              child: const Text('ADD', style: TextStyle(color: Colors.white)),
            )
          ],
        ),
      ],
    );
  }

  Widget _buildStyleTab() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Select Style', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        const SizedBox(height: 12),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: styles.map((style) {
            final isSelected = selectedStyle == style;
            return GestureDetector(
              onTap: () => setState(() => selectedStyle = style),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.navy : Colors.grey[200],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  style,
                  style: TextStyle(
                    color: isSelected ? Colors.white : AppColors.textDark,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildSizeTab() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Select Size', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        const SizedBox(height: 12),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: sizes.map((size) {
            final isSelected = selectedSize == size;
            return GestureDetector(
              onTap: () => setState(() => selectedSize = size),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.primary : Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  size,
                  style: TextStyle(
                    color: isSelected ? Colors.white : AppColors.textDark,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildTab(String label, int index) {
    final isSelected = selectedTab == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => selectedTab = index),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.navy : Colors.grey[200],
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isSelected ? Colors.white : AppColors.textDark,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
