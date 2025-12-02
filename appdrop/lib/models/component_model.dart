import 'package:flutter/widgets.dart';

class ComponentModel {
  final String type;
  final Map<String, dynamic> data;

  ComponentModel({required this.type, required this.data});

  factory ComponentModel.fromJson(Map<String, dynamic> json) {
    return ComponentModel(
      type: json['type'] as String,
      data: json,
    );
  }

  // Method to map `type` to the corresponding widget
  Widget toWidget() {
    switch (type) {
      case 'banner':
        return BannerWidget(data: data);
      case 'carousel':
        return CarouselWidget(data: data);
      case 'grid':
        return GridWidget(data: data);
      case 'video':
        return VideoBlockWidget(data: data);
      case 'text':
        return TextBlockWidget(data: data);
      default:
        return const SizedBox.shrink();
    }
  }
}

// Example widget classes (replace with your actual implementations)
class BannerWidget extends StatelessWidget {
  final Map<String, dynamic> data;
  const BannerWidget({required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(); // Replace with actual implementation
  }
}

class CarouselWidget extends StatelessWidget {
  final Map<String, dynamic> data;
  const CarouselWidget({required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(); // Replace with actual implementation
  }
}

class GridWidget extends StatelessWidget {
  final Map<String, dynamic> data;
  const GridWidget({required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(); // Replace with actual implementation
  }
}

class VideoBlockWidget extends StatelessWidget {
  final Map<String, dynamic> data;
  const VideoBlockWidget({required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(); // Replace with actual implementation
  }
}

class TextBlockWidget extends StatelessWidget {
  final Map<String, dynamic> data;
  const TextBlockWidget({required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(); // Replace with actual implementation
  }
}

// Factory method to create a widget from a ComponentModel
Widget buildWidget(ComponentModel component) {
  return component.toWidget();
}

// Example usage
ComponentModel component =
    ComponentModel(type: 'banner', data: {'key': 'value'});
Widget widget = buildWidget(component);
