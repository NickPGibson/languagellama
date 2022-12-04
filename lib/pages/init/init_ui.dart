

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:languagellama/pages/init/init_bloc.dart';
import 'package:languagellama/pages/init/init_state.dart';
import 'package:languagellama/pages/main_menu/main_menu.dart';
import 'package:languagellama/pages/word_pack/word_pack_ui.dart';

class InitUi extends StatelessWidget {

  const InitUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<InitBloc, InitState>(
        listener: (context, state) {
          if (state is InitStateLoggedIn || state is InitStateLoggedOut) {
            GoRouter.of(context).go('/');
          }
        },
        child: BlocBuilder<InitBloc, InitState>(
          builder: (context, state) {
            if (state is InitStateLoggedIn) {
              return const WordPackUi();
            } else if (state is InitStateLoggedOut) {
              return const MainMenu();
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
