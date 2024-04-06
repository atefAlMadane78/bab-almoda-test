import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      this.border,
      this.margin,
      this.color,
      this.onTap,
      this.padding,
      this.widget,
      this.height,
      this.raduis,
      this.width});
  final Color? color;
  final Function()? onTap;
  final Widget? widget;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final double? height;
  final double? width;
  final BoxBorder? border;
  final double? raduis;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          width: width,
          height: height,
          padding: padding,
          margin: margin,
          decoration: BoxDecoration(
            border: border,
            color: color,
            borderRadius:raduis!= null? BorderRadius.circular(raduis!) :null
          ),
          alignment: Alignment.center,
          child: widget,
        ));
  }
}
