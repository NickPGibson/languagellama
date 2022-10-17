
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:languagellama/pages/match/game_state.dart';
import 'package:languagellama/pages/match/match_bloc.dart';
import 'package:languagellama/pages/match/match_event.dart';
import 'package:languagellama/pages/match/match_state.dart';
import 'package:languagellama/repository/repository.dart';
import 'package:languagellama/widgets/llama_game_widget.dart';
import 'package:languagellama/widgets/panel.dart';
import 'package:collection/collection.dart';

import 'match_tile.dart';

class MatchUi extends StatelessWidget {
  const MatchUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MatchBloc(context.read<Repository>())..add(StartMatch()),
      child: Builder(
        builder: (context) => LlamaGameWidget(
          child: BlocBuilder<MatchBloc, MatchState>(
            builder: (context, state) {
              if (state is MatchInProgress) {
                return Column(
                  children: [
                    GameState(
                      secondsRemaining: state.secondsRemaining,
                      score: state.score
                    ),
                    Expanded(
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          const numRows = 4;
                          const numColumns = 2;
                          final smallestSide = min(constraints.maxHeight / numRows, constraints.maxWidth / numColumns);
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    children: state.nativeWords.mapIndexed((index, e) => Panel(
                                      color: e.state == MatchTileState.selected ? Colors.green : Colors.white,
                                      onTap: () => BlocProvider.of<MatchBloc>(context).add(NativeWordTapped(index: index)),
                                      visible: e.text != null,
                                      width: smallestSide,
                                      height: smallestSide,
                                      key: ValueKey("a$index"),
                                      child: e.text != null ? Text(e.text!) : const SizedBox.shrink(),
                                    )).toList(),
                                  ),
                                  Column(
                                    children: state.targetWords.mapIndexed((index, e) => Panel(
                                      color: e.state == MatchTileState.selected ? Colors.green : Colors.white,
                                      onTap: () => BlocProvider.of<MatchBloc>(context).add(TargetWordTapped(index: index)),
                                      visible: e.text != null,
                                      width: smallestSide,
                                      height: smallestSide,
                                      key: ValueKey("b$index"),
                                      child: e.text != null ? Text(e.text!) : const SizedBox.shrink(),
                                    )).toList(),
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.pause, size: 50,),)
                  ],
                );
              } else if (state is MatchFinished) {
                return Center(child: Text("Game over. Score: ${state.score}"),);
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        )
      ),
    );
  }
}
