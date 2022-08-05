import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateInput extends StatelessWidget {
  final String? hintText;
  final bool obscureText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final TextEditingController controller;

  @override
  const DateInput({
    Key? key,
    required this.controller,
    required this.hintText,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    required this.validator,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: hintText,
          suffixIcon: const Icon(Icons.calendar_today)),
      readOnly: true,
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(
                2000), //DateTime.now() - not to allow to choose before today.
            lastDate: DateTime(2101));

        if (pickedDate != null) {
          String formattedDate = DateFormat('MM/dd/yyyy').format(pickedDate);
          controller.text = formattedDate;
        }
      },
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
    );
  }
}
