
import 'package:equatable/equatable.dart';
import 'package:languagellama/pages/match/match_tile.dart';

class MatchState with EquatableMixin {

  final int secondsRemaining;
  final List<MatchTile> nativeWords;
  final List<MatchTile> targetWords;

  MatchState({required this.secondsRemaining, required this.nativeWords, required this.targetWords});

  @override
  List<Object?> get props => [secondsRemaining, nativeWords, targetWords];
}
