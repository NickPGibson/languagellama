

import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {

  const LoginState();

}

class LoginStateLoading extends LoginState {

  const LoginStateLoading();

  @override
  List<Object?> get props => [];
}

class LoginStateReady extends LoginState {

  final String? message;

  const LoginStateReady({this.message});

  @override
  List<Object?> get props => [message];
}
