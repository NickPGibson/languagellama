

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:languagellama/repository/repository.dart';
import 'package:languagellama/widgets/options/options_event.dart';
import 'package:languagellama/widgets/options/options_state.dart';

class OptionsBloc extends Bloc<OptionsEvent, OptionsState> {

  final Repository _repository;

  OptionsBloc(this._repository) : super(const OptionsStateInitial()) {
    on<OptionsEvent>(
      (event, emit) async {
        if (event is InitOptions) {
          emit(const OptionsStateLoading());
          final user = _repository.getUser();
          final username = user?.username;
          final initial = _getInitial(username);
          emit(OptionsStateReady(currentUser: username, initial: initial));
        }

        if (event is SignOut) {
          await _repository.logout();
        }
      }, transformer: sequential()
    );
  }

  static String? _getInitial(String? username) {
    if (username == null || username.isEmpty) {
      return null;
    }
    return username[0].toUpperCase();
  }
}
