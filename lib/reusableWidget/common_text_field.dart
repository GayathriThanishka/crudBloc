// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CommonTextField extends StatelessWidget {
  final TextEditingController controller;
  final String fieldName;
  const CommonTextField(
      {required this.controller, required this.fieldName, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(fieldName),
        const SizedBox(
          height: 12,
        ),
        SizedBox(
          width: 500,
          child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "please enter $fieldName";
                } else {
                  return null;
                }
              }),
        )
      ],
    );
  }
}
