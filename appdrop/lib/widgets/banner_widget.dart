import 'package:flutter/material.dart';

class BannerWidget extends StatelessWidget {
  final Map<String, dynamic> data;

  const BannerWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final double padding = (data['padding'] ?? 0).toDouble();
    final double radius = (data['radius'] ?? 0).toDouble();
    final double height = (data['height'] ?? 150).toDouble();
    final String? imageUrl = data['image'];

    if (imageUrl == null || imageUrl.isEmpty) {
      return Padding(
        padding: EdgeInsets.all(padding),
        child: const Center(
          child: Text(
            'Image not available',
            style: TextStyle(color: Colors.red),
          ),
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.all(padding),
      child: SizedBox(
        height: height,
        width: double.infinity,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => const Center(
              child: Text(
                'Failed to load image',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
