

import 'package:equatable/equatable.dart';

abstract class OptionsEvent extends Equatable {
  const OptionsEvent();
}

class InitOptions extends OptionsEvent {
  const InitOptions();

  @override
  List<Object?> get props => [];
}

class SignOut extends OptionsEvent {
  @override
  List<Object?> get props => [];
}
