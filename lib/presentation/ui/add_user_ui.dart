import 'package:blocaddevent/presentation/component/add_user.dart';
import 'package:flutter/material.dart';

class AddUserUi extends StatefulWidget {
  const AddUserUi({super.key});

  @override
  State<AddUserUi> createState() => _AddUserUiState();
}

class _AddUserUiState extends State<AddUserUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add User Information"),
        backgroundColor: Color.fromARGB(255, 216, 212, 212),
        centerTitle: true,
      ),
      backgroundColor: Color.fromARGB(255, 226, 225, 225),
      body: AddUser(),
    );
  }
}
