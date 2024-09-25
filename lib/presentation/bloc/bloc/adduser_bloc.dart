import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:fpdart/fpdart.dart'; // Importing fpdart

part 'adduser_event.dart';
part 'adduser_state.dart';

class AdduserBloc extends Bloc<AdduserEvent, AdduserState> {
  List<Adduser> userList = [];

  AdduserBloc() : super(AdduserInitial()) {
    on<AddUserButtonClickEvent>(_onAddUserButtonClickEvent);
    on<DeleteButtonClickEvent>(_onDeleteButtonClickEvent);
    on<EditButtonClickEvent>(_onEditButtonClickEvent);
  }

  // Handling Add User Event
  Future<void> _onAddUserButtonClickEvent(
    AddUserButtonClickEvent event,
    Emitter<AdduserState> emit,
  ) async {
    // Using Either to manage success and error cases
    final result = await _addUser(event.name, event.email, event.addUserList);

    result.fold(
      (left) => emit(AddUserFailureState(error: left)),
      (updatedList) => emit(AddUserSucessState(addUserList: updatedList)),
    );
  }

  // Function that handles the logic of adding a user
  Future<Either<String, List<Adduser>>> _addUser(
    String name,
    String email,
    List<Adduser> currentList,
  ) async {
    return Either.tryCatch(
      () {
    
        final updatedList = List<Adduser>.from(currentList);
        updatedList.add(Adduser(name: name, email: email));
        return updatedList;
      },
      (error, _) => 'Failed to add user: ${error.toString()}',
    );
  }

  // Handling Delete Button Click Event
  Future<void> _onDeleteButtonClickEvent(
    DeleteButtonClickEvent event,
    Emitter<AdduserState> emit,
  ) async {
    final result = await _deleteUser(event.user);

    result.match(
      (error) => emit(AddUserFailureState(error: error)),
      (updatedList) => emit(DeleteSucessState(updatedUserList: updatedList)),
    );
  }

  // Function that handles the logic of deleting a user
  Future<Either<String, List<Adduser>>> _deleteUser(Adduser user) async {
    return Either.tryCatch(
      () {
        // Simulating async operation
        final updatedList = List<Adduser>.from(userList);
        updatedList.remove(user);
        return updatedList;
      },
      (error, _) => 'Failed to delete user: ${error.toString()}',
    );
  }

  // Handling Edit Button Click Event
  Future<void> _onEditButtonClickEvent(
    EditButtonClickEvent event,
    Emitter<AdduserState> emit,
  ) async {
    final result = await _editUser(event.editUser);

    result.match(
      (error) => emit(AddUserFailureState(error: error)),
      (updatedUser) => emit(EditSucessState()),
    );
  }

  // Function that handles the logic of editing a user
  Future<Either<String, Adduser>> _editUser(Adduser editUser) async {
    return Either.tryCatch(
      () {
        
        return editUser; 
      },
      (error, _) => 'Failed to edit user: ${error.toString()}',
    );
  }
}
