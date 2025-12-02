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

    return Padding(
      padding: EdgeInsets.all(padding),
      child: Text(
        textValue,
        textAlign: align == 'center' ? TextAlign.center : TextAlign.left,
        style: TextStyle(
          fontFamily: 'NotoSans', // Use the NotoSans font
          fontSize: fontSize,
          fontWeight: weight == 'bold' ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
