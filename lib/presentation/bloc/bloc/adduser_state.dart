part of 'adduser_bloc.dart';

@immutable
sealed class AdduserState {}

final class AdduserInitial extends AdduserState {}

final class AddUserSucessState extends AdduserState{
  final List<Adduser>addUserList;

  AddUserSucessState({required this.addUserList});
}
final class AddUserFailureState extends AdduserState{
  final String error;

  AddUserFailureState({required this.error});
}

