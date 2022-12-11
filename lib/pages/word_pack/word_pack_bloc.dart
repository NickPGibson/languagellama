

import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:languagellama/pages/word_pack/pack.dart';
import 'package:languagellama/pages/word_pack/word_pack_event.dart';
import 'package:languagellama/pages/word_pack/word_pack_state.dart';
import 'package:languagellama/repository/models/pack_meta_data.dart';
import 'package:languagellama/repository/repository.dart';

class WordPackBloc extends Bloc<WordPackEvent, WordPackState> {

  final Repository _repository;
  StreamSubscription? _packUserDataSubscription;

  late Map<String, PackMetaData> _packsIndex;

  WordPackBloc(this._repository): super(WordPackInitial()) {
    on<WordPackEvent>((event, emit) async {
      if (event is LoadPacks) {
        emit(WordPackLoading());
        _packsIndex = await _repository.getPackIndex(LanguagePair.enEs);
        _packUserDataSubscription = _repository.getAllPackUserData().listen((event) {
          add(PackUserDataChanged(event));
        });
      }

      if (event is PackUserDataChanged) {
        final packs = _packsIndex.entries
            .map((packMetaData) => Pack(id: packMetaData.key, name: packMetaData.value.name, highScore: event.packUserData[packMetaData.key]?.highScore))
            .toList();

        emit(WordPackReady(packs: packs));
      }
    }, transformer: sequential());
  }

  @override
  Future<void> close() {
    _packUserDataSubscription?.cancel();
    return super.close();
  }
}
