import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    this.suffixWidget,
    this.isVisiable = false,
    this.justNumber = false,
    this.lableSize,
  });

  final TextEditingController controller;
  final String label;
  final Widget? suffixWidget;
  final bool isVisiable;
  final bool justNumber;
  final double? lableSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: TextFormField(
        controller: controller,
        obscureText: isVisiable,
        keyboardType: justNumber ? TextInputType.number : null,
        inputFormatters:
            justNumber ? [FilteringTextInputFormatter.digitsOnly] : [],
        decoration: InputDecoration(
            border: InputBorder.none,
            suffixIcon: suffixWidget ??
                Container(
                  width: 1,
                ),
            label: Text(
              label,
              style: TextStyle(
                fontSize: lableSize ?? 14.sp,
                color: const Color(0xffC5C5C5),
              ),
            )),
      ),
    );
  }
}
