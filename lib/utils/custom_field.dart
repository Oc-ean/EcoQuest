import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  final String hintText;
  final dynamic controller;

  final TextInputType? keyboardType;
  final int? maxLines;
  final double? borderRadius;

  final Widget? suffixIcon;
  final Widget prefixIcon;
  final FormFieldValidator? validator;
  FormFieldSetter? onSaved;
  final bool? obscureText;

  CustomField(
      {Key? key,
      required this.hintText,
      this.controller,
      this.keyboardType,
      this.maxLines,
      this.borderRadius,
      this.suffixIcon,
      required this.prefixIcon,
      this.validator,
      required this.obscureText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(21),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              offset: const Offset(3, 3),
              blurRadius: 6,
              color: Colors.grey.shade400),
        ],
      ),
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: const EdgeInsets.only(top: 14),
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey.shade200,
          ),
          prefixIcon: prefixIcon,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(21),
            borderSide: BorderSide.none,
          ),
        ),
        validator: validator,
        onSaved: onSaved,
        obscureText: obscureText!,
      ),
    );
  }
}
