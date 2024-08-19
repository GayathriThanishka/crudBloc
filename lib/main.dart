import 'package:blocaddevent/presentation/component/add_user.dart';
import 'package:blocaddevent/presentation/ui/add_user_ui.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AddUserUi(),
    );
  }
}
