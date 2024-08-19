// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CommonIconField extends StatelessWidget {
  
  final VoidCallback onTap;
  final Icon iconName;

  
  
  const CommonIconField({
    Key? key,
   
    required this.onTap, required this.iconName,
    
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: onTap, icon: iconName);
  }
}
