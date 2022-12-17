

import 'package:equatable/equatable.dart';

abstract class ResetPasswordState extends Equatable {}

class ResetPasswordStateReady extends ResetPasswordState {

  final String? message;

  ResetPasswordStateReady({this.message});

  @override
  List<Object?> get props => [message];
}

class ResetPasswordLoading extends ResetPasswordState {
  @override
  List<Object> get props => [];
}