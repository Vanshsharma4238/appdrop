import 'package:flutter/material.dart';

class GridWidget extends StatelessWidget {
  final Map<String, dynamic> data;

  const GridWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final List<String> images = (data['images'] as List<dynamic>? ?? [])
        .map((e) => e.toString())
        .toList();
    final double padding = (data['padding'] ?? 0).toDouble();
    final int columns = (data['columns'] ?? 2).toInt();
    final double spacing = (data['spacing'] ?? 8).toDouble();

    if (images.isEmpty) {
      return Padding(
        padding: EdgeInsets.all(padding),
        child: const Center(
          child: Text(
            'No images available',
            style: TextStyle(color: Colors.grey),
          ),
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.all(padding),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: images.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: columns,
          crossAxisSpacing: spacing,
          mainAxisSpacing: spacing,
        ),
        itemBuilder: (_, index) {
          final imageUrl = images[index];
          return Image.network(
            imageUrl,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => const Center(
              child: Text(
                'Failed to load image',
                style: TextStyle(color: Colors.red),
              ),
            ),
          );
        },
      ),
    );
  }
}
