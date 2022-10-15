
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:languagellama/pages/match/game_state.dart';
import 'package:languagellama/widgets/llama_game_widget.dart';
import 'package:languagellama/widgets/panel.dart';

class MatchUi extends StatelessWidget {
  const MatchUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LlamaGameWidget(
      child: Column(
        children: [
          const GameState(),
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                const numRows = 3;
                const numColumns = 2;
                final smallestSide = min(constraints.maxHeight / numRows, constraints.maxWidth / numColumns);
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Panel(visible: false, width: smallestSide, height: smallestSide, key: ValueKey("a0"), child: const Text("Hello"),),
                            Panel(visible: true, width: smallestSide, height: smallestSide,  key: ValueKey("a1"), child: const Text("Dog")),
                            Panel(visible: true, width: smallestSide, height: smallestSide,  key: ValueKey("a2"), child: const Text("Watch")),
                          ],
                        ),
                        Column(
                          children: [
                            Panel(visible: true, width: smallestSide, height: smallestSide,  key: ValueKey("b0"), child: const Text("Perro"),),
                            Panel(visible: true, width: smallestSide, height: smallestSide,  key: ValueKey("b1"), child: const Text("Reloj"),),
                            Panel(visible: false, width: smallestSide, height: smallestSide, key: ValueKey("b2"), child: const Text("Hola"),),
                          ],
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
      )
    );
  }
}
