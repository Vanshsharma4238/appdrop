import 'dart:async';

import 'package:flutter/material.dart';

class CarouselWidget extends StatefulWidget {
  final Map<String, dynamic> data;

  const CarouselWidget({super.key, required this.data});

  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  late final PageController _controller;
  Timer? _autoPlayTimer;

  List<String> get _images =>
      (widget.data['images'] as List<dynamic>? ?? []).map((e) => '$e').toList();

  double get _height => (widget.data['height'] ?? 200).toDouble();
  double get _padding => (widget.data['padding'] ?? 0).toDouble();
  double get _spacing => (widget.data['spacing'] ?? 0).toDouble();
  bool get _autoPlay => widget.data['autoPlay'] == true;
  Duration get _interval {
    final raw = widget.data['intervalSeconds'];
    final seconds = (raw is num ? raw : 3).clamp(1, 30).toInt();
    return Duration(seconds: seconds);
  }

  @override
  void initState() {
    super.initState();
    _controller = PageController();
    if (_autoPlay && _images.length > 1) {
      _startAutoPlay();
    }
  }

  void _startAutoPlay() {
    _autoPlayTimer?.cancel();
    _autoPlayTimer = Timer.periodic(_interval, (_) {
      if (!mounted || _images.length < 2) return;
      final nextPage = _controller.page == null
          ? 1
          : (_controller.page!.round() + 1) % _images.length;
      _controller.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _autoPlayTimer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final child = _images.isEmpty
        ? const Center(
            child: Text(
              'No images available',
              style: TextStyle(color: Colors.grey),
            ),
          )
        : SizedBox(
            height: _height,
            child: PageView.builder(
              controller: _controller,
              padEnds: false,
              itemCount: _images.length,
              itemBuilder: (_, index) {
                final imageUrl = _images[index];
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: _spacing / 2),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      (widget.data['radius'] ?? 0).toDouble(),
                    ),
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
                );
              },
            ),
          );

    return Padding(
      padding: EdgeInsets.all(_padding),
      child: child,
    );
  }
}
