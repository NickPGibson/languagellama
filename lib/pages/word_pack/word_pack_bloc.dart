

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:languagellama/pages/word_pack/pack.dart';
import 'package:languagellama/pages/word_pack/word_pack_event.dart';
import 'package:languagellama/pages/word_pack/word_pack_state.dart';
import 'package:languagellama/repository/repository.dart';

class WordPackBloc extends Bloc<WordPackEvent, WordPackState> {

  final Repository _repository;

  WordPackBloc(this._repository): super(WordPackInitial()) {
    on<WordPackEvent>((event, emit) async {
      if (event is LoadPacks) {
        emit(WordPackLoading());
        final packsIndex = await _repository.getPackIndex(LanguagePair.enEs);
        final packUserData = await _repository.getAllPackUserData();

        final packs = packsIndex.entries
            .map((packMetaData) => Pack(id: packMetaData.key, name: packMetaData.value.name, highScore: packUserData[packMetaData.key]?.highScore))
            .toList();

        emit(WordPackReady(packs: packs));
      }
    }, transformer: sequential());
  }
}
