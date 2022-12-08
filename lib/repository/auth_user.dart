
import 'package:equatable/equatable.dart';

class AuthUser extends Equatable {

  final String? username;

  const AuthUser({this.username});

  @override
  List<Object?> get props => [username];
}