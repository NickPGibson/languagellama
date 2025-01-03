

import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class DoLogin extends LoginEvent {

  final String email;
  final String password;

  const DoLogin({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}
