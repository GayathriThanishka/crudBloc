import 'package:blocaddevent/presentation/ui/add_user_ui.dart';
import 'package:blocaddevent/reusableWidget/common_delete_button.dart';
import 'package:flutter/material.dart';
import 'package:blocaddevent/presentation/bloc/bloc/adduser_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewUserList extends StatelessWidget {
  final List<Adduser> addUserList;

  const ViewUserList({Key? key, required this.addUserList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = AdduserBloc();
    bloc.userList = addUserList; // Initialize with the passed list

    return BlocConsumer<AdduserBloc, AdduserState>(
      bloc: bloc,
      buildWhen: (previous, current) => true,
      listenWhen: (previous, current) => current is! AdduserInitial,
      listener: (context, state) {
        if (state is AddUserSucessState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("User list updated successfully")),
          );
        } else if (state is DeleteSucessState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("User deleted successfully")),
          );
        } else if (state is EditSucessState) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddUserUi(),
            ),
          );
        } else if (state is AddUserFailureState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Error: ${state.error}")),
          );
        }
      },
      builder: (context, state) {
        List<Adduser> currentList = state is AddUserSucessState
            ? state.addUserList
            : state is DeleteSucessState
                ? state.updatedUserList
                : addUserList;

        return Scaffold(
          appBar: AppBar(
            title: const Text("User List"),
            centerTitle: true,
            backgroundColor: const Color.fromARGB(255, 216, 212, 212),
          ),
          body: ListView.builder(
            itemCount: currentList.length,
            itemBuilder: (context, index) {
              final user = currentList[index];
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(20),
                  ),
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
                            onTap: () {
                              bloc.add(EditButtonClickEvent(editUser: user));
                            },
                            iconName: const Icon(Icons.edit),
                          ),
                          CommonIconField(
                            onTap: () {
                              bloc.add(DeleteButtonClickEvent(user));
                            },
                            iconName: const Icon(Icons.delete_forever),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
