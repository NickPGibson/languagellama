
import 'package:equatable/equatable.dart';

abstract class MatchEvent with EquatableMixin {}

class StartMatch extends MatchEvent {

  final String id;

  StartMatch({required this.id});

  @override
  List<Object?> get props => [id];
}

class FinishMatch extends MatchEvent {
  @override
  List<Object?> get props => [];
}

class TimerChanged extends MatchEvent {

  final int seconds;

  TimerChanged({required this.seconds});

  @override
  List<Object?> get props => [seconds];
}

class NativeWordTapped extends MatchEvent {

  final int index;

  NativeWordTapped({required this.index});

  @override
  List<Object?> get props => [index];
}

class TargetWordTapped extends MatchEvent {

  final int index;

  TargetWordTapped({required this.index});

  @override
  List<Object?> get props => [index];
}

class DoWordRefill extends MatchEvent {
  @override
  List<Object?> get props => [];
}

class Pause extends MatchEvent {
  @override
  List<Object?> get props => [];
}

class Resume extends MatchEvent {
  @override
  List<Object?> get props => [];
}
