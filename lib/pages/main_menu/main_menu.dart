import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:languagellama/widgets/llama_menu_widget.dart';
import 'package:languagellama/widgets/standard_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => LlamaMenuWidget(
    child: Column(
      children: [
        Text(
          AppLocalizations.of(context)!.welcomeToLanguageLLama,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 30,),
        const CircleAvatar(backgroundImage: AssetImage('assets/llama.png'), radius: 80),
        const SizedBox(height: 30,),
        StandardButton(title: AppLocalizations.of(context)!.login, onPressed: () {
          GoRouter.of(context).go('/login');
        }),
        const SizedBox(height: 30,),
        StandardButton(title: AppLocalizations.of(context)!.createAccount, onPressed: () {
          GoRouter.of(context).go('/createAccount');
        }),
      ],
    )
  );
}
