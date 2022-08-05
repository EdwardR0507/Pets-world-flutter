import 'package:flutter/material.dart';

class ImageInputIcon extends StatelessWidget {
  final String title;
  final IconData? icon;
  final VoidCallback? onClicked;

  @override
  const ImageInputIcon({
    Key? key,
    required this.title,
    required this.icon,
    required this.onClicked,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(56),
        primary: Colors.white,
        onPrimary: Colors.grey,
        textStyle: const TextStyle(fontSize: 17),
      ),
      onPressed: onClicked,
      child: Row(
        children: [
          Icon(icon, size: 28),
          const SizedBox(width: 16),
          Text(title),
        ],
      ),
    );
  }
}
