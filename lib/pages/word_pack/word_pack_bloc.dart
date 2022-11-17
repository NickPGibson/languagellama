

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:languagellama/pages/word_pack/word_pack_event.dart';
import 'package:languagellama/pages/word_pack/word_pack_state.dart';
import 'package:languagellama/repository/repository.dart';

class WordPackBloc extends Bloc<WordPackEvent, WordPackState> {

  final Repository _repository;

  WordPackBloc(this._repository): super(WordPackInitial()) {
    on<WordPackEvent>((event, emit) {
      if (event is LoadPacks) {
        emit(WordPackLoading());
        final packs = _repository.getPacks();
        emit(WordPackReady(packs: packs));
      }
    }, transformer: sequential());
  }
}
