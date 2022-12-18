
import 'package:equatable/equatable.dart';

abstract class ErrorReportState extends Equatable {
  const ErrorReportState();

}

class ErrorReportStateReady extends ErrorReportState {

  final String? message;

  const ErrorReportStateReady([this.message]);

  @override
  List<Object?> get props => [message];
}

class ErrorReportStateLoading extends ErrorReportState {
  @override
  List<Object> get props => [];
}