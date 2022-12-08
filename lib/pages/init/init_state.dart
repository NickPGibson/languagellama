
import 'package:equatable/equatable.dart';

abstract class InitState extends Equatable {}

class InitStateInitial extends InitState {
  @override
  List<Object?> get props => [];
}


class InitStateLoggedOut extends InitState {
  @override
  List<Object?> get props => [];
}

class InitStateLoggedIn extends InitState {
  @override
  List<Object?> get props => [];
}
