

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:languagellama/pages/login/login_event.dart';
import 'package:languagellama/pages/login/login_state.dart';
import 'package:languagellama/repository/exceptions.dart';
import 'package:languagellama/repository/repository.dart';


class LoginBloc extends Bloc<LoginEvent, LoginState> {

  final Repository _repository;

  LoginBloc(this._repository) : super(const LoginStateReady()) {
    on<LoginEvent>((event, emit) async {
      if (event is DoLogin) {
        emit(const LoginStateLoading());
        try {
          await _repository.login(email: event.email, password: event.password);
        } on ServerException catch (e) {
          emit(LoginStateReady(message: e.message));
        }
      }
    }, transformer: sequential());
  }
}
