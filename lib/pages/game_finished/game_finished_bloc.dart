
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:languagellama/pages/game_finished/game_finished_event.dart';
import 'package:languagellama/pages/game_finished/game_finished_state.dart';
import 'package:languagellama/repository/repository.dart';

class GameFinishedBloc extends Bloc<GameFinishedEvent, GameFinishedState> {

  final Repository _repository;

  GameFinishedBloc(this._repository): super(GameFinishedInitial()) {
    on<GameFinishedEvent>((event, emit) async {
      if (event is LoadGameSummary) {
        emit(GameFinishedLoading());
        final packUserData = await _repository.getPackUserData(packId: event.id);
        final highScore = packUserData?.highScore;
        final isNewHighScore = highScore == null || event.score > highScore;
        if (isNewHighScore) {
          _repository.setHighScore(packId: event.id, highScore: event.score);
        }
        emit(GameFinishedLoaded(
          highScore: isNewHighScore ? event.score: highScore,
          isNewHighScore: isNewHighScore
        ));
      }
    }, transformer: sequential());
  }
}
