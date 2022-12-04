

import 'package:equatable/equatable.dart';

abstract class CreateAccountState extends Equatable {
  const CreateAccountState();
}

class CreateAccountStateReady extends CreateAccountState {

  final String? message;

  const CreateAccountStateReady({this.message});

  @override
  List<Object?> get props => [message];
}

class CreateAccountLoading extends CreateAccountState {
  @override
  List<Object?> get props => [];
}