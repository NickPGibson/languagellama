
import 'package:equatable/equatable.dart';

abstract class AccountSettingsEvent extends Equatable {
  const AccountSettingsEvent();
}

class DeleteAccountPressed extends AccountSettingsEvent {
  const DeleteAccountPressed();

  @override
  List<Object?> get props => [];
}
