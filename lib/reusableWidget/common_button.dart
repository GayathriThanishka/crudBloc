// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CommonButtonField extends StatelessWidget {
  final String buttonName;
  final VoidCallback onTap;
  final Color color;
  final Color textColor;
  const CommonButtonField({
    Key? key,
    required this.buttonName,
    required this.onTap,
    required this.color,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            fixedSize: const Size(150, 50),
            backgroundColor: color,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
        child: Text(
          buttonName,
          style: TextStyle(color: textColor, fontWeight: FontWeight.w700),
        ));
  }
}
