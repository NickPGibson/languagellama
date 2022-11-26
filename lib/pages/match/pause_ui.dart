

import 'package:flutter/material.dart';
import 'package:languagellama/widgets/llama_game_widget.dart';
import 'package:languagellama/widgets/standard_button.dart';

class PauseUi extends StatelessWidget {
  final void Function() onResume;
  final void Function() onExit;

  const PauseUi({Key? key, required this.onResume, required this.onExit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: LlamaGameWidget(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Paused", style: Theme.of(context).textTheme.headline5,),
            const SizedBox(height: 10,),
            StandardButton(title: "Resume", onPressed: () {
              onResume();
              Navigator.of(context).pop();
            }),
            const SizedBox(height: 10,),
            StandardButton(title: "Exit", onPressed: () {
              onExit();
              Navigator.of(context).pop();
            }),
          ],
        )
    ),
    onWillPop: () async {
      onResume();
      return true;
    });
  }
}
