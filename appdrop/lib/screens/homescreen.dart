import 'package:flutter/material.dart';
import '../models/component_model.dart';
import '../factory/widget_factory.dart';

class HomeScreen extends StatelessWidget {
  final Map<String, dynamic> pageJson;

  const HomeScreen({super.key, required this.pageJson});

  @override
  Widget build(BuildContext context) {
    final components = (pageJson['page']?['components'] as List<dynamic>? ?? [])
        .map((e) => ComponentModel.fromJson(e as Map<String, dynamic>))
        .toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Dynamic UI')),
      body: components.isEmpty
          ? const Center(child: Text('No components available'))
          : ListView.builder(
              itemCount: components.length,
              itemBuilder: (_, index) => WidgetFactory.build(components[index]),
            ),
    );
  }
}
