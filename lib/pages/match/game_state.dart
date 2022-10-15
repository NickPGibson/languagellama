

import 'package:flutter/material.dart';

class GameState extends StatelessWidget {
  const GameState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: const [
        Text("0:59", style: TextStyle(fontSize: 24),),
        Text("24", style: TextStyle(fontSize: 24),),
      ],
    );
  }
}
