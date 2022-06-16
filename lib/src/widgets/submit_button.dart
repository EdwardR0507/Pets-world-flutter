import "package:flutter/material.dart";

class CustomSubmitButton extends StatelessWidget {
  final void Function() onPressed;
  final String text;
  final double width;

  const CustomSubmitButton(
      {Key? key,
      required this.onPressed,
      required this.text,
      this.width = double.infinity})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 40.0,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: const Color(0xFF6200EE),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        onPressed: onPressed,
        child: Text(
          text,
        ),
      ),
    );
  }
}
