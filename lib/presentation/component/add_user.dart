import 'package:blocaddevent/presentation/bloc/bloc/adduser_bloc.dart';
import 'package:blocaddevent/presentation/ui/view_user_list.dart';
import 'package:blocaddevent/reusableWidget/common_button.dart';
import 'package:blocaddevent/reusableWidget/common_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddUser extends StatelessWidget {
  const AddUser({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailIdController = TextEditingController();
    final bloc = AdduserBloc();
    final formkey = GlobalKey<FormState>();

    return Center(
      child: BlocConsumer<AdduserBloc, AdduserState>(
        bloc: bloc,
        buildWhen: (previous, current) => current is AdduserInitial,
        listenWhen: (previous, current) => current is! AdduserInitial,
        listener: (context, state) {
          if (state is AddUserSucessState) {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return ViewUserList(addUserList: state.addUserList);
              },
            ));
          } else if (state is AddUserFailureState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        },
        builder: (context, state) {
          return Form(
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CommonTextField(
                    controller: nameController, fieldName: "UserName"),
                const SizedBox(
                  height: 12,
                ),
                CommonTextField(
                    controller: emailIdController, fieldName: "EmailId"),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CommonButtonField(
                      color: const Color.fromARGB(255, 121, 75, 248),
                      buttonName: "Save",
                      onTap: () {
                        if (formkey.currentState!.validate()) {
                          bloc.add(AddUserButtonClickEvent(
                              addUserList: bloc.userList,
                              name: nameController.text,
                              email: emailIdController.text));
                        }
                      },
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    CommonButtonField(
                      color: const Color.fromARGB(255, 240, 87, 87),
                      buttonName: "Cancel",
                      onTap: () {
                        nameController.clear();
                        emailIdController.clear();
                      },
                    )
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
