import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.color, required this.isSelected});

  final Color color;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        radius: 28,
        backgroundColor: isSelected ? Colors.white : Colors.transparent,
        child:  CircleAvatar(radius: 24, backgroundColor: color));
  }
}
