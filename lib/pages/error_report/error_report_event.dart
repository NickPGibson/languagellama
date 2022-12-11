
import 'package:equatable/equatable.dart';

abstract class ErrorReportEvent extends Equatable {
  const ErrorReportEvent();

  @override
  List<Object> get props => [];
}

class SendErrorReport extends ErrorReportEvent {
  final String message;
  final String packId;

  const SendErrorReport({required this.message, required this.packId});

  @override
  List<Object> get props => [message, packId];
}