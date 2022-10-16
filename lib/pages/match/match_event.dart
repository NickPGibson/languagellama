
import 'package:equatable/equatable.dart';

abstract class MatchEvent with EquatableMixin {}

class StartMatch extends MatchEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class FinishMatch extends MatchEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class TimerChanged extends MatchEvent {

  final int seconds;

  TimerChanged({required this.seconds});

  @override
  List<Object?> get props => [seconds];
}
