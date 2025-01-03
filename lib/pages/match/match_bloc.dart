

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
  int? _incorrectNativeIndex;
  int? _incorrectTargetIndex;

  static const numWordPairs = 5;

  final _nativeWords = List<String?>.filled(numWordPairs, null, growable: false);
  final _targetWords = List<String?>.filled(numWordPairs, null, growable: false);

  StreamSubscription<int>? _timerSubscription;
  StreamSubscription? _wordRefillTimerSubscription;

  MatchBloc(this._repository) : super(MatchStateNotStarted()) {
    on<MatchEvent>((event, emit) async {
      if (event is StartMatch) {

        final packContent = await _repository.getPackContents(event.id);
        packContent.forEach((key, value) {
          _answers.add(key, value);
        });

        final initialNativeWords = _answers.keys.sample(numWordPairs);
        final initialTargetWords = initialNativeWords.map((e) => _answers[e].sample(1).single).toList()..shuffle();

        _nativeWords.setAll(0, initialNativeWords);
        _targetWords.setAll(0, initialTargetWords);

        _timerSubscription?.cancel();
        _timerSubscription = Timer().tick(ticks: _gameLength).listen((seconds) => add(TimerChanged(seconds: seconds)));
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
        _onTileTapped();
        emit(_matchState);
      }

      if (event is TargetWordTapped) {
        _selectedTargetIndex = event.index;
        _onTileTapped();
        emit(_matchState);
      }

      if (event is DoWordRefill) {
        _getNextPair();
        _getNextPair(); // generate up to 2 pairs at once to make it more challenging
      }

      if (event is Pause) {
        _timerSubscription?.pause();
      }

      if (event is Resume) {
        _timerSubscription?.resume();
      }
    }, transformer: sequential());
  }

  MatchState get _matchState {

    if (_selectedNativeIndex != null && _selectedTargetIndex != null) {
      if (_answers.contains(_nativeWords[_selectedNativeIndex!], _targetWords[_selectedTargetIndex!])) {
        ++_score;

        _nativeWords[_selectedNativeIndex!] = null;
        _targetWords[_selectedTargetIndex!] = null;

        if (_nativeWords.where((element) => element == null).length == 1) {
          _wordRefillTimerSubscription?.cancel();
          _wordRefillTimerSubscription = Timer().tickPerpetual().listen((seconds) => add(DoWordRefill()));
        }
      } else {
        _incorrectNativeIndex = _selectedNativeIndex;
        _incorrectTargetIndex = _selectedTargetIndex;
      }

      _selectedNativeIndex = null;
      _selectedTargetIndex = null;
    }

    return MatchInProgress(
      score: _score,
      secondsRemaining: _secondsRemaining,
      nativeWords: _nativeWords.mapIndexed((index, e) => MatchTile(text: e, state: _getTileState(index: index, selectedIndex: _selectedNativeIndex, incorrectIndex: _incorrectNativeIndex))).toList(),
      targetWords: _targetWords.mapIndexed((index, e) => MatchTile(text: e, state: _getTileState(index: index, selectedIndex: _selectedTargetIndex, incorrectIndex: _incorrectTargetIndex))).toList()
    );
  }

  MatchTileState _getTileState({required int index, int? selectedIndex, int? incorrectIndex}) {
    if (index == selectedIndex) {
      return MatchTileState.selected;
    } else if (index == incorrectIndex) {
      return MatchTileState.incorrect;
    } else {
      return MatchTileState.normal;
    }
  }

  void _onTileTapped() {
    _incorrectNativeIndex = null;
    _incorrectTargetIndex = null;
  }

  void _getNextPair() {
    final emptyNativeSpots = <int?>[];
    _nativeWords.forEachIndexed((index, element) {
      if (element == null) {
        emptyNativeSpots.add(index);
      }
    });

    if (emptyNativeSpots.isNotEmpty) {
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
    _wordRefillTimerSubscription?.cancel();
    return super.close();
  }
}
