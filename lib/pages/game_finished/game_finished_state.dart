
import 'package:equatable/equatable.dart';

abstract class GameFinishedState extends Equatable {}

class GameFinishedInitial extends GameFinishedState {
  @override
  List<Object?> get props => [];
}

class GameFinishedLoading extends GameFinishedState {
  @override
  List<Object?> get props => [];
}

class GameFinishedLoaded extends GameFinishedState {

  final int highScore;
  final bool isNewHighScore;

  GameFinishedLoaded({required this.highScore, required this.isNewHighScore});

  @override
  List<Object?> get props => [highScore, isNewHighScore];
}
