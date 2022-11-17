
import 'package:equatable/equatable.dart';
import 'package:languagellama/repository/pack.dart';

abstract class WordPackState extends Equatable {}

class WordPackInitial extends WordPackState {
  @override
  List<Object?> get props => [];
}

class WordPackLoading extends WordPackState {
  @override
  List<Object?> get props => [];
}

class WordPackReady extends WordPackState {

  final List<Pack> packs;

  WordPackReady({required this.packs});

  @override
  List<Object?> get props => [packs];
}
