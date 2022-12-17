

import 'package:equatable/equatable.dart';

abstract class ChangePasswordEvent extends Equatable {}

class ChangePassword extends ChangePasswordEvent {

  final String newPassword;

  ChangePassword(this.newPassword);

  @override
  List<Object> get props => [newPassword];
}

