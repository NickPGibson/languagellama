

import 'package:equatable/equatable.dart';

abstract class ContactUsEvent extends Equatable {
  const ContactUsEvent();
}

class SendContactUsMessage extends ContactUsEvent {
  final String message;

  const SendContactUsMessage(this.message);

  @override
  List<Object> get props => [message];
}