
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:languagellama/pages/change_password/change_password_event.dart';
import 'package:languagellama/pages/change_password/change_password_state.dart';
import 'package:languagellama/repository/exceptions.dart';
import 'package:languagellama/repository/repository.dart';

class ChangePasswordBloc extends Bloc<ChangePasswordEvent, ChangePasswordState> {

  final Repository _repository;

  ChangePasswordBloc(this._repository): super(ChangePasswordStateReady()) {
    on<ChangePassword>((event, emit) async {
      emit(ChangePasswordLoading());
      try {
        await _repository.changePassword(password: event.newPassword);
        emit(ChangePasswordStateReady(message: "Password changed"));
      } on ServerException catch (e) {
        emit(ChangePasswordStateReady(message: e.message));
      }
    });
  }

}