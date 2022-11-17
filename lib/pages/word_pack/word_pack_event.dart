

import 'package:equatable/equatable.dart';

abstract class WordPackEvent extends Equatable {}

class LoadPacks extends WordPackEvent {
  @override
  List<Object?> get props => [];
}
