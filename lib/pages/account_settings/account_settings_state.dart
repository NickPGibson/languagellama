

import 'package:equatable/equatable.dart';

abstract class AccountSettingsState extends Equatable {
  const AccountSettingsState();
}


class AccountSettingsReady extends AccountSettingsState {

  final String? message;

  const AccountSettingsReady({this.message});

  @override
  List<Object?> get props => [message];
}

class AccountSettingsLoading extends AccountSettingsState {
  const AccountSettingsLoading();

  @override
  List<Object?> get props => [];
}
