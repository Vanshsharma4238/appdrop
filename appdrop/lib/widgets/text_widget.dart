import 'package:flutter/material.dart';

class TextBlockWidget extends StatelessWidget {
  final Map<String, dynamic> data;

  const TextBlockWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final double padding = (data['padding'] ?? 0).toDouble();
    final String textValue = data['value'] ?? '';
    final String? align = data['align'];
    final double fontSize = (data['size'] ?? 16).toDouble();
    final String? weight = data['weight'];
    final String? font = data['font'];

    return Padding(
      padding: EdgeInsets.all(padding),
      child: Text(
        textValue,
        textAlign: _resolveAlign(align),
        style: TextStyle(
          fontFamily: font ?? 'NotoSans', // Use the font from JSON, fallback to NotoSans
          fontSize: fontSize,
          fontWeight: weight == 'bold' ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }

  TextAlign _resolveAlign(String? align) {
    switch (align) {
      case 'center':
        return TextAlign.center;
      case 'right':
        return TextAlign.right;
      case 'justify':
        return TextAlign.justify;
      default:
        return TextAlign.left;
    }
  }
}
