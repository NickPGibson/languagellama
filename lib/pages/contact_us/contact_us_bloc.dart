

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:languagellama/pages/contact_us/contact_us_event.dart';
import 'package:languagellama/pages/contact_us/contact_us_state.dart';
import 'package:languagellama/repository/repository.dart';

class ContactUsBloc extends Bloc<ContactUsEvent, ContactUsState> {
  final Repository _repository;

  ContactUsBloc(this._repository) : super(const ContactUsReady()) {
    on<ContactUsEvent>((event, emit) async {
      if (event is SendContactUsMessage) {
        emit(const ContactUsLoading());
        try {
          await _repository.sendContactMessage(message: event.message);
          emit(const ContactUsReady(message: "Thank you for your message!"));
        } on Exception {
          emit(const ContactUsReady(message: "An error occurred."));
        }
      }
    });
  }
}
