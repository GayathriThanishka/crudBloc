import 'package:blocaddevent/reusableWidget/common_delete_button.dart';
import 'package:flutter/material.dart';
import 'package:blocaddevent/presentation/bloc/bloc/adduser_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewUserList extends StatelessWidget {
  final List<Adduser> addUserList;

  const ViewUserList({Key? key, required this.addUserList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User List"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 216, 212, 212),
      ),
      body: ListView.builder(
        itemCount: addUserList.length,
        itemBuilder: (context, index) {
          final user = addUserList[index];
          return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(20)),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(15),
                  leading: CircleAvatar(
                    backgroundColor: Colors.blueAccent,
                    child: Text(
                      user.name[0].toUpperCase(),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  title: Text(user.name),
                  subtitle: Text(user.email),
                  trailing: SizedBox(
                    width: 90,
                    child: Row(
                      children: [
                        CommonIconField(
                            onTap: () {},
                            iconName:
                                const Icon(Icons.edit_attributes_outlined)),
                        CommonIconField(
                            onTap: () {
                              context
                                  .read<AdduserBloc>()
                                  .add(DeleteButtonClickEvent(user));
                            },
                            iconName: const Icon(Icons.delete_forever)),
                      ],
                    ),
                  ),
                ),
              ));
        },
      ),
    );
  }
}
