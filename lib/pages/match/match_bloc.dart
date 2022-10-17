

import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:languagellama/pages/match/match_event.dart';
import 'package:languagellama/pages/match/match_state.dart';
import 'package:languagellama/pages/match/match_tile.dart';
import 'package:languagellama/pages/match/timer.dart';
import 'package:languagellama/repository/repository.dart';
import 'package:quiver/collection.dart';
import 'package:collection/collection.dart';

class MatchBloc extends Bloc<MatchEvent, MatchState> {

  static const _gameLength = 60;
  var _secondsRemaining = _gameLength;
  var _score = 0;

  final Repository _repository;

  final _answers = Multimap<String, String>();

  int? _selectedNativeIndex;
  int? _selectedTargetIndex;

  final _nativeWords = List<String?>.filled(4, null, growable: false);
  final _targetWords = List<String?>.filled(4, null, growable: false);

  final _timer = Timer();
  StreamSubscription<int>? _timerSubscription;


  MatchBloc(this._repository) : super(MatchStateNotStarted()) {
    on<MatchEvent>((event, emit) {
      if (event is StartMatch) {

        final initialWords = _repository.getLanguagePairs(4);
        initialWords.forEach((key, value) {
          _answers.add(key, value);
        });

        _nativeWords.setAll(0, initialWords.keys);
        _targetWords..setAll(0, initialWords.values)..shuffle();

        _timerSubscription?.cancel();
        _timerSubscription = _timer
            .tick(ticks: _gameLength)
            .listen((seconds) => add(TimerChanged(seconds: seconds)));
      }

      if (event is TimerChanged) {
        if (event.seconds == 0) {
          emit(MatchFinished(score: _score));
        } else {
          _secondsRemaining = event.seconds;
          emit(_matchState);
        }
      }

      if (event is NativeWordTapped) {
        _selectedNativeIndex = event.index;
        emit(_matchState);
      }

      if (event is TargetWordTapped) {
        _selectedTargetIndex = event.index;
        emit(_matchState);
      }
    }, transformer: sequential());
  }

  MatchState get _matchState {

    if (_selectedNativeIndex != null && _selectedTargetIndex != null) {


      if (_answers.contains(_nativeWords[_selectedNativeIndex!], _targetWords[_selectedTargetIndex!])) {
        ++_score;
      }

      _selectedNativeIndex = null;
      _selectedTargetIndex = null;
    }

    return MatchInProgress(
      score: _score,
      secondsRemaining: _secondsRemaining,
      nativeWords: _nativeWords.mapIndexed((index, e) => MatchTile(text: e, state: index == _selectedNativeIndex ?  MatchTileState.selected : MatchTileState.normal)).toList(),
      targetWords: _targetWords.mapIndexed((index, e) => MatchTile(text: e, state: index == _selectedTargetIndex ?  MatchTileState.selected : MatchTileState.normal)).toList()
    );
  }

  @override
  Future<void> close() {
    _timerSubscription?.cancel();
    return super.close();
  }
}
