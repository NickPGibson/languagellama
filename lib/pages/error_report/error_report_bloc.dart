

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:languagellama/pages/error_report/error_report_event.dart';
import 'package:languagellama/pages/error_report/error_report_state.dart';
import 'package:languagellama/repository/repository.dart';

class ErrorReportBloc extends Bloc<ErrorReportEvent, ErrorReportState> {

  final Repository _repository;

  ErrorReportBloc(this._repository): super(const ErrorReportStateReady()) {
    on<ErrorReportEvent>((event, emit) async {
      if (event is SendErrorReport) {
        emit(ErrorReportStateLoading());
        await _repository.sendErrorReport(message: event.message, packId: event.packId);
        emit(const ErrorReportStateReady("Thank you for helping to improve LanguageLlama!"));
      }
    });
  }
}