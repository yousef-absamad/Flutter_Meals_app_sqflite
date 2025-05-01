import 'package:flutter/material.dart';
import 'package:meal_app_sqflite/core/styels/app_colors.dart';

class CustomTextField extends StatefulWidget {
  final String? hintText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final VoidCallback? onTap; // دالة تُنفذ عند الضغط
  final IconData? icon;
  final GlobalKey<FormFieldState>? formFieldKey;
  final String? Function(String?)? validator;
  final int? maxLines;

  const CustomTextField({
    super.key,
     this.hintText,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.onTap,
    this.icon,
    this.validator,
    this.formFieldKey,
    this.maxLines,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: widget.formFieldKey,
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      validator: widget.validator,
      maxLines: widget.maxLines ?? 1,
      onTap: widget.onTap,
      decoration: InputDecoration(
        hintText: widget.hintText ?? '',
        prefixIcon: widget.icon == null ? null : Icon(widget.icon, color: Colors.green),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.primaryColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide:  BorderSide(color: Colors.grey.shade300),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
