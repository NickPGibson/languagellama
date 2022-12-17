

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:languagellama/pages/reset_password/reset_password_event.dart';
import 'package:languagellama/pages/reset_password/reset_password_state.dart';
import 'package:languagellama/repository/exceptions.dart';
import 'package:languagellama/repository/repository.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  
  final Repository _repository;
  
  ResetPasswordBloc(this._repository) : super(ResetPasswordStateReady()) {
    on<ResetPassword>((event, emit) async {
      emit(ResetPasswordLoading());
      try {
        await _repository.resetPassword(email: event.email);
        emit(ResetPasswordStateReady(message: "Password reset email sent."));
      } on ServerException catch (e) {
        emit(ResetPasswordStateReady(message: e.message));
      }
    });
  }
}
