

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:languagellama/widgets/llama_menu_widget.dart';
import 'package:languagellama/widgets/standard_button.dart';

class GameFinishedUi extends StatelessWidget {

  final int score;

  const GameFinishedUi({required this.score, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => LlamaMenuWidget(
    child: Column(
      children: [
        Text(
          'Score: $score',
          style: Theme.of(context).textTheme.headline5,
        ),
        const SizedBox(height: 30,),
        StandardButton(title: "Play again", onPressed: () {
          GoRouter.of(context).go('/play');
        }),
      ],
    )
  );
}
