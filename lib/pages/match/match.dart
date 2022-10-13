
import 'package:flutter/material.dart';
import 'package:languagellama/widgets/llama_game_widget.dart';

class MatchUi extends StatelessWidget {
  const MatchUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const LlamaGameWidget(child: Text("Game Time"));
  }
}
