

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:languagellama/pages/game_finished/game_finished_bloc.dart';
import 'package:languagellama/pages/game_finished/game_finished_event.dart';
import 'package:languagellama/pages/game_finished/game_finished_state.dart';
import 'package:languagellama/pages/match/game_summary.dart';
import 'package:languagellama/repository/repository.dart';
import 'package:languagellama/widgets/llama_menu_widget.dart';
import 'package:languagellama/widgets/standard_button.dart';

class GameFinishedUi extends StatelessWidget {

  final GameSummary summary;

  const GameFinishedUi({required this.summary, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => LlamaMenuWidget(
    child: BlocProvider(
      create: (context) => GameFinishedBloc(context.read<Repository>())..add(LoadGameSummary(score: summary.score, id: summary.id)),
      child: Builder(
        builder: (context) => BlocBuilder<GameFinishedBloc, GameFinishedState>(
          builder: (context, state) {
            return Column(
              children: [
                Text(
                  'Score: ${summary.score}',
                  style: Theme.of(context).textTheme.headline5,
                ),
                const SizedBox(height: 30,),
                StandardButton(
                  title: "Play again",
                  onPressed: () => GoRouter.of(context).go('/wordPack/play', extra: summary.id)
                ),
              ],
            );
          }
        ),
      ),
    )
  );
}
