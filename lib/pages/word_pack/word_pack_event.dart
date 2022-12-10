

import 'package:equatable/equatable.dart';
import 'package:languagellama/repository/models/pack_user_data.dart';

abstract class WordPackEvent extends Equatable {}

class LoadPacks extends WordPackEvent {
  @override
  List<Object?> get props => [];
}

class PackUserDataChanged extends WordPackEvent {

  final Map<String, PackUserData> packUserData;

  PackUserDataChanged(this.packUserData);

  @override
  List<Object?> get props => [packUserData];
}
