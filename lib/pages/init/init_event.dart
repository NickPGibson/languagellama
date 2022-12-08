
import 'package:equatable/equatable.dart';

abstract class InitEvent extends Equatable {
}

class StartApp extends InitEvent {
  @override
  List<Object?> get props => [];
}

class UserAuthenticated extends InitEvent {

  @override
  List<Object?> get props => [];
}

class UserNotAuthenticated extends InitEvent {
  @override
  List<Object?> get props => [];
}
