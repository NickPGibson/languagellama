
import 'package:equatable/equatable.dart';
import 'package:languagellama/pages/match/match_tile.dart';

abstract class MatchState with EquatableMixin {}

class MatchStateNotStarted extends MatchState {
  @override
  List<Object?> get props => [];
}

class MatchInProgress extends MatchState {

  final int secondsRemaining;
  final List<MatchTile> nativeWords;
  final List<MatchTile> targetWords;
  final int score;

  MatchInProgress({
    required this.score,
    required this.secondsRemaining,
    required this.nativeWords,
    required this.targetWords
  });

  @override
  List<Object?> get props => [secondsRemaining, score, nativeWords, targetWords];
}

class MatchFinished extends MatchState {

  final int score;

  MatchFinished({required this.score});

  @override
  List<Object?> get props => [score];
}