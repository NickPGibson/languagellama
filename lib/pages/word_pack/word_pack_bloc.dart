

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:languagellama/assets_repository/assets_repository.dart';
import 'package:languagellama/pages/word_pack/pack.dart';
import 'package:languagellama/pages/word_pack/word_pack_event.dart';
import 'package:languagellama/pages/word_pack/word_pack_state.dart';
import 'package:languagellama/repository/repository.dart';

class WordPackBloc extends Bloc<WordPackEvent, WordPackState> {

  final Repository _repository;
  final AssetsRepository _assetsRepository;

  WordPackBloc(this._repository, this._assetsRepository): super(WordPackInitial()) {
    on<WordPackEvent>((event, emit) async {
      if (event is LoadPacks) {
        emit(WordPackLoading());
        final packsIndex = await _assetsRepository.packsIndex;
        final packs = <Pack>[];
        for (final staticPack in packsIndex.languagePairs.enEs.packs) {
          final packUserData = await _repository.getPackUserData(staticPack.id);
          packs.add(Pack(id: staticPack.id, name: staticPack.name, highScore: packUserData?.highScore));
        }
        emit(WordPackReady(packs: packs));
      }
    }, transformer: sequential());
  }
}
