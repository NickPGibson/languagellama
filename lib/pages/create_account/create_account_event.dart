

import 'package:equatable/equatable.dart';

abstract class CreateAccountEvent extends Equatable {}

class CreateAccountPressed extends CreateAccountEvent {

  final String email;
  final String password;

  CreateAccountPressed({required this.email, required this.password});

  @override
  List<Object?> get props =>[email, password];
}
