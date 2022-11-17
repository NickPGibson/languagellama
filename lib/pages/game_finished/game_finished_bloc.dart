
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:languagellama/pages/game_finished/game_finished_event.dart';
import 'package:languagellama/pages/game_finished/game_finished_state.dart';
import 'package:languagellama/repository/repository.dart';

class GameFinishedBloc extends Bloc<GameFinishedEvent, GameFinishedState> {

  final Repository _repository;

  GameFinishedBloc(this._repository): super(GameFinishedInitial()) {
    on<GameFinishedEvent>((event, emit) {
      if (event is LoadGameSummary) {
        final highScore = _repository.getHighScore(id: event.id);
        if (highScore != null && event.score > highScore) {
          _repository.setHighScore(id: event.id, highScore: event.score);
        }
      }
    }, transformer: sequential());
  }
}
