import 'package:flutter/material.dart';
class TextInput extends StatelessWidget {
  final String? hintText;
  final bool obscureText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  

  @override
  const TextInput({
     Key? key,
    required this.hintText,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    required this.validator,
    required this.onSaved,
  }): super(key: key);
 @override
 Widget build(BuildContext context) {
  return TextFormField(
      decoration: InputDecoration(border: const OutlineInputBorder(), hintText: hintText),
      obscureText: obscureText,
      validator: validator,
      onSaved: onSaved,
    );
 }
}