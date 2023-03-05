
import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:languagellama/pages/init/init_event.dart';
import 'package:languagellama/pages/init/init_state.dart';
import 'package:languagellama/repository/repository.dart';

class InitBloc extends Bloc<InitEvent, InitState> {

  final Repository _repository;
  StreamSubscription? _authSubscription;

  InitBloc(this._repository) : super(InitStateInitial()) {
    on<InitEvent>((event, emit) async {
      if (event is StartApp) {
        _repository.setLanguageCode();
        final authStream = _repository.getAuthStateStream();
        _authSubscription = authStream.listen((user) {
          if (user != null) {
            add(UserAuthenticated());
          } else {
            add(UserNotAuthenticated());
          }
        });
      }

      if (event is UserAuthenticated) {
        emit(InitStateLoggedIn());
      }

      if (event is UserNotAuthenticated) {
        emit(InitStateLoggedOut());
      }
    }, transformer: sequential());
  }

  @override
  Future<void> close() {
    _authSubscription?.cancel();
    return super.close();
  }
}
