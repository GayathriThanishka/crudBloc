

part of 'adduser_bloc.dart';

@immutable
sealed class AdduserState {}

final class AdduserInitial extends AdduserState {}

final class AddUserSucessState extends AdduserState {
  final List<Adduser> addUserList;

  AddUserSucessState({required this.addUserList});
}

final class AddUserFailureState extends AdduserState {
  final String error;

  AddUserFailureState({required this.error});
}

//delete details

class DeleteSucessState extends AdduserState {
  final List<Adduser> updatedUserList;

  DeleteSucessState({required this.updatedUserList});
}
//edit details

class EditSucessState extends AdduserState {}
