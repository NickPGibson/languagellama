
import 'package:equatable/equatable.dart';

abstract class GameFinishedEvent extends Equatable {}

class LoadGameSummary extends GameFinishedEvent {

  final int score;
  final String id;

  LoadGameSummary({required this.score, required this.id});

  @override
  List<Object?> get props => [score, id];
}
