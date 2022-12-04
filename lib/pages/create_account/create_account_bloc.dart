

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:languagellama/pages/create_account/create_account_event.dart';
import 'package:languagellama/pages/create_account/create_account_state.dart';
import 'package:languagellama/repository/exceptions.dart';
import 'package:languagellama/repository/repository.dart';

class CreateAccountBloc extends Bloc<CreateAccountEvent, CreateAccountState> {
  
  final Repository _repository;
  
  CreateAccountBloc(this._repository) : super(const CreateAccountStateReady()) {

    on<CreateAccountEvent>((event, emit) async {
      if (event is CreateAccountPressed) {
        emit(CreateAccountLoading());
        try {
          await _repository.createAccount(email: event.email, password: event.password);
        } on ServerException catch (e) {
          emit(CreateAccountStateReady(message: e.message));
        }
      }
    }, transformer: sequential());
  }
}
