

import 'package:equatable/equatable.dart';

abstract class ChangePasswordState extends Equatable {}

class ChangePasswordStateReady extends ChangePasswordState {

  final String? message;

  ChangePasswordStateReady({this.message});

  @override
  List<Object?> get props => [message];
}

class ChangePasswordLoading extends ChangePasswordState {
  @override
  List<Object> get props => [];
}