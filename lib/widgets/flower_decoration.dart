import 'package:flutter/material.dart';

class FlowerDecoration extends StatelessWidget {
  final double size;

  const FlowerDecoration({
    super.key,
    this.size = 35,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.local_florist,
      size: size,
      color: Colors.pink,
    );
  }
}