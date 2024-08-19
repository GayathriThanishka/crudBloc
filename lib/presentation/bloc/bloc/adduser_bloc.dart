import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'adduser_event.dart';
part 'adduser_state.dart';

class AdduserBloc extends Bloc<AdduserEvent, AdduserState> {
  List<Adduser> addUserList = [];
  AdduserBloc() : super(AdduserInitial()) {
    on<AddUserButtonClickEvent>(addUserButtonClickEvent);
    on<DeleteButtonClickEvent>(deleteButtonClickEvent);
  }

  FutureOr<void> addUserButtonClickEvent(
      AddUserButtonClickEvent event, Emitter<AdduserState> emit) {
    if (event.name.isEmpty || event.email.isEmpty) {
      emit(AddUserFailureState(error: "Enter all field"));
    } else {
      addUserList.add(Adduser(name: event.name, email: event.email));
      emit(AddUserSucessState(addUserList: event.addUserList));
    }
  }

  FutureOr<void> deleteButtonClickEvent(
      DeleteButtonClickEvent event, Emitter<AdduserState> emit) {
    addUserList.remove(event.user);
    emit(AddUserSucessState(addUserList: addUserList));
  }
}
