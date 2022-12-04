

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:languagellama/pages/account_settings/account_settings_event.dart';
import 'package:languagellama/pages/account_settings/account_settings_state.dart';
import 'package:languagellama/repository/exceptions.dart';
import 'package:languagellama/repository/repository.dart';

class AccountSettingsBloc extends Bloc<AccountSettingsEvent, AccountSettingsState> {

  final Repository _repository;

  AccountSettingsBloc(this._repository) : super(const AccountSettingsReady()) {
    on<AccountSettingsEvent>((event, emit) async {
      if (event is DeleteAccountPressed) {
        emit(const AccountSettingsLoading());
        try {
          await _repository.deleteAccount();
        } on ServerException catch (e) {
          emit(AccountSettingsReady(message: e.message));
        }
      }
    }, transformer: sequential());
  }
}
