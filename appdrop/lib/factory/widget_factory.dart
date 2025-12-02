import 'package:flutter/material.dart';
import '../models/component_model.dart' hide BannerWidget, TextBlockWidget, VideoBlockWidget, GridWidget, CarouselWidget;
import '../widgets/banner_widget.dart';
import '../widgets/carousel_widget.dart';
import '../widgets/grid_widget.dart';
import '../widgets/text_widget.dart';
import '../widgets/video_widget.dart';

class WidgetFactory {
  static Widget build(ComponentModel component) {
    switch (component.type) {
      case 'banner':
        return BannerWidget(data: component.data);
      case 'carousel':
        return CarouselWidget(data: component.data);
      case 'grid':
        return GridWidget(data: component.data);
      case 'text':
        return TextBlockWidget(data: component.data);
      case 'video':
        return VideoBlockWidget(data: component.data);
      default:
        return const SizedBox.shrink();
    }
  }
}
