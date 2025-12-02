// lib/widgets/carousel_widget.dart
import 'package:flutter/material.dart';

class CarouselWidget extends StatelessWidget {
  final Map<String, dynamic> data;

  const CarouselWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final List<dynamic> images = data['images'] ?? [];
    final double height = (data['height'] ?? 200).toDouble();
    final double padding = (data['padding'] ?? 0).toDouble();

    if (images.isEmpty) {
      return const Center(
        child: Text(
          'No images available',
          style: TextStyle(color: Colors.grey),
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.all(padding),
      child: SizedBox(
        height: height,
        child: PageView.builder(
          itemCount: images.length,
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
      ),
    );
  }
}
