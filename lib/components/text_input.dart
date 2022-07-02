import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;

  @override
  const TextInput({
    Key? key,
    required this.hintText,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    required this.validator,
    this.controller,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          label: Text(hintText!),
          border: const OutlineInputBorder(),
          hintText: hintText),
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
    );
  }
}
