import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.label,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.isOverFlow,
  });

  final String? label;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final bool? isOverFlow;

  @override
  Widget build(BuildContext context) {
    return Text(
      label ?? '',
      style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
          overflow: isOverFlow ?? false ? TextOverflow.ellipsis : null),
    );
  }
}
