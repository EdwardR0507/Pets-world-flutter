import 'package:flutter/material.dart';
class DropDownInput extends StatelessWidget {
  final String? hintText;
  final void Function(String?)? onSaved;
  final Icon? nameIcon;
  final List<DropdownMenuItem<String>>? listaItems;
  final void Function(String?)? onChanged;

  @override
  const DropDownInput({
    Key? key,
    required this.hintText,
    required this.onSaved,

    required this.nameIcon,
    required this.listaItems,
    required this.onChanged
  }): super(key: key);
  @override
  Widget build(BuildContext context) {

    return DropdownButtonFormField(
        decoration: InputDecoration(border: const OutlineInputBorder(), hintText: hintText, prefixIcon: nameIcon),
        onSaved: onSaved,
        items: listaItems,
        onChanged: onChanged
    );

  }
}