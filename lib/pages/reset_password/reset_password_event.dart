

import 'package:equatable/equatable.dart';

abstract class ResetPasswordEvent extends Equatable {}

class ResetPassword extends ResetPasswordEvent {

  final String email;

  ResetPassword(this.email);

  @override
  List<Object> get props => [email];
}

