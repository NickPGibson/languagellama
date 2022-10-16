
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

  MatchInProgress({required this.secondsRemaining, required this.nativeWords, required this.targetWords});

  @override
  List<Object?> get props => [secondsRemaining, nativeWords, targetWords];
}
