// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomTextfield extends StatefulWidget {
  final TextInputType textInputType;
  final bool isPassword;
  final String hinttexttt;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final TextEditingController? controller;
  final Color? suffixColor;
  final String? Function(String?)? validatorFunction;

  const CustomTextfield({
    Key? key,
    required this.textInputType,
    required this.isPassword,
    required this.hinttexttt,
    this.suffixIcon,
    this.prefixIcon,
    this.controller,
    this.suffixColor,
    this.validatorFunction,
  }) : super(key: key);

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  bool _obscureText = true; // حالة إخفاء النص

  @override
  void initState() {
    super.initState();
    _obscureText =
        widget.isPassword; // تعيين الحالة الأولية بناءً على القيمة الممررة
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText; // تبديل الحالة
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      child: TextFormField(
        validator: widget.validatorFunction,
        keyboardType: widget.textInputType,
        onFieldSubmitted: (value) {
          FocusScope.of(context).requestFocus();
        },
        obscureText: _obscureText, // استخدام الحالة لإخفاء أو إظهار النص
        controller: widget.controller,
        decoration: InputDecoration(
          prefixIcon: Icon(widget.prefixIcon),
          suffixIcon: IconButton(
            onPressed: _togglePasswordVisibility, // استدعاء الدالة عند النقر
            icon: Icon(
              _obscureText
                  ? Icons.visibility_off
                  : Icons.visibility, // تغيير الأيقونة بناءً على الحالة
              color: widget.suffixColor,
            ),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(22)),
          hintText: widget.hinttexttt,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: const BorderSide(color: Colors.blue),
          ),
          filled: true,
          contentPadding: const EdgeInsets.all(8),
        ),
      ),
    );
  }
}
