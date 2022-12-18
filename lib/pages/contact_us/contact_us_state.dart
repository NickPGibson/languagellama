

import 'package:equatable/equatable.dart';

abstract class ContactUsState extends Equatable {
  const ContactUsState();
}

class ContactUsReady extends ContactUsState {
  const ContactUsReady({this.message});

  final String? message;

  @override
  List<Object?> get props => [message];
}

class ContactUsLoading extends ContactUsState {
  const ContactUsLoading();

  @override
  List<Object> get props => [];
}
