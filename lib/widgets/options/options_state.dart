
import 'package:equatable/equatable.dart';

abstract class OptionsState extends Equatable {
  const OptionsState();
}

class OptionsStateInitial extends OptionsState {
  const OptionsStateInitial();

  @override
  List<Object?> get props => [];
}

class OptionsStateLoading extends OptionsState {

  const OptionsStateLoading();

  @override
  List<Object?> get props => [];
}

class OptionsStateReady extends OptionsState {

  final String? initial;
  final String? currentUser;

  const OptionsStateReady({required this.currentUser, required this.initial});

  @override
  List<Object?> get props => [currentUser, initial];
}
