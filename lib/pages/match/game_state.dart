

import 'package:flutter/material.dart';

class GameState extends StatelessWidget {

  final int secondsRemaining;
  final int score;

  const GameState({required this.secondsRemaining, required this.score, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(secondsRemaining.toString(), style: const TextStyle(fontSize: 24),),
        Text(score.toString(), style: const TextStyle(fontSize: 24),),
      ],
    );
  }
}
