

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

        _repository.getLanguagePairs().forEach((key, value) {
          _answers.add(key, value);
        });

        final initialNativeWords = _answers.keys.sample(4);
        final initialTargetWords = initialNativeWords.map((e) => _answers[e].sample(1).single).toList()..shuffle();

        _nativeWords.setAll(0, initialNativeWords);
        _targetWords.setAll(0, initialTargetWords);

        _timerSubscription?.cancel();
        _timerSubscription = _timer
            .tick(ticks: _gameLength)
            .listen((seconds) => add(TimerChanged(seconds: seconds)));
      }

      if (event is TimerChanged) {
        if (event.seconds == 0) {
          emit(MatchFinished(score: _score));
        } else {
          if (event.seconds % 2 == 0) {
            _getNextPair(1);
          }
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

        _nativeWords[_selectedNativeIndex!] = null;
        _targetWords[_selectedTargetIndex!] = null;

        //_getNextPair(3);
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

  void _getNextPair(int minimumEmptySpots) {
    final emptyNativeSpots = <int?>[];
    _nativeWords.forEachIndexed((index, element) {
      if (element == null) {
        emptyNativeSpots.add(index);
      }
    });

    if (emptyNativeSpots.length >= minimumEmptySpots) {
      final nextNativeWord = _answers.keys.sample(1);
      final nextTargetWord = nextNativeWord.map((e) => _answers[e].sample(1).single).toList()..shuffle();

      final nextNativeSpotIndex = emptyNativeSpots.sample(1).first!;
      _nativeWords[nextNativeSpotIndex] = nextNativeWord.first;

      final emptyTargetSpots = <int?>[];
      _targetWords.forEachIndexed((index, element) {
        if (element == null) {
          emptyTargetSpots.add(index);
        }
      });

      final nextTargetSpotIndex = emptyTargetSpots.sample(1).first!;
      _targetWords[nextTargetSpotIndex] = nextTargetWord.first;

    }
  }

  @override
  Future<void> close() {
    _timerSubscription?.cancel();
    return super.close();
  }
}
