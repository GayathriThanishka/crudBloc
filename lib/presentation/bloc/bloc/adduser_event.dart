part of 'adduser_bloc.dart';

@immutable
sealed class AdduserEvent {}
class AddUserButtonClickEvent extends AdduserEvent{
  final List<Adduser>addUserList;
  final String name;
  final String email;

  AddUserButtonClickEvent({required this.name, required this.email,required this.addUserList,});
}
class Adduser{
  final String name;
  final String email;

  Adduser({required this.name, required this.email});
}

//Delete icon click event

class DeleteButtonClickEvent extends AdduserEvent {
final Adduser user;

  DeleteButtonClickEvent(this.user);
  
}
//Edit Button Event

class EditButtonClickEvent extends AdduserEvent{
  final Adduser editUser;

  EditButtonClickEvent({required this.editUser});
}


