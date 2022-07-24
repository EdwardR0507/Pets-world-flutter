import 'package:flutter/material.dart';

class DropDownInput extends StatelessWidget {
  const DropDownInput({
    Key? key,
    required this.items,
    required this.hint,
    required this.onChanged,
    this.iconSize = 16.0,
    this.selectedValue,
    this.textStyle,
    required this.nameIcon,
  }) : super(key: key);

  final List<DropdownItem> items;
  final Icon nameIcon;
  final String hint;
  final String? selectedValue;
  final Function(String?) onChanged;
  final double iconSize;
  final TextStyle? textStyle;

  List<DropdownMenuItem<String>> _buildItems() => items
      .map((DropdownItem item) => DropdownMenuItem<String>(
            value: item.value,
            child: Text(
              item.label,
              style: textStyle,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ))
      .toList();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: const Color(0xFFEAE9F0),
        ),
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
        ),
        child: DropdownButton<String>(
          value: selectedValue,
          items: _buildItems(),
          onChanged: onChanged,
          isExpanded: true,
          menuMaxHeight: 500,
          isDense: false,
          underline: Container(),
          icon: nameIcon,
          hint: Text(
            hint,
            style: textStyle,
          ),
        ),
      ),
    );
  }
}

class DropdownItem {
  DropdownItem({required this.value, required this.label});

  final String value;
  final String label;
}
