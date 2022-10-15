

import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:languagellama/pages/match/match_event.dart';
import 'package:languagellama/pages/match/match_state.dart';
import 'package:languagellama/repository/repository.dart';

class MatchBloc extends Bloc<MatchEvent, MatchState> {

  static const _gameLength = 60;
  var _counter = _gameLength;

  final Repository repository;
  
  MatchBloc({required this.repository}) : super(MatchState(secondsRemaining: _gameLength, )) {
    on<MatchEvent>((event, emit) {
      if (event is StartMatch) {
        Timer.periodic(
          const Duration(seconds: 1),
          (timer) {
            --_counter;
            emit(MatchState(secondsRemaining: _counter));
            if (_counter == 0) {
              timer.cancel();
              add(FinishMatch());
            }
          }
        );
      }

      if (event is FinishMatch) {

      }

    }, transformer: sequential());
  }
}
