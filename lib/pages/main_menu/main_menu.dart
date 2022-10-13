import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:languagellama/widgets/llama_menu_widget.dart';
import 'package:languagellama/widgets/standard_button.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>LlamaMenuWidget(child:
    Column(
      children: [
        Text(
          'Welcome to Language Llama!',
          style: Theme.of(context).textTheme.headline5,
        ),
        const SizedBox(height: 30,),
        const CircleAvatar(backgroundImage: AssetImage('assets/llama.png'), radius: 80),
        const SizedBox(height: 30,),
        StandardButton(title: "Start", onPressed: () {
          GoRouter.of(context).go('/play');
        }),
      ],
    )
  );
}
