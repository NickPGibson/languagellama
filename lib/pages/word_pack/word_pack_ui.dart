

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:languagellama/pages/word_pack/word_pack_bloc.dart';
import 'package:languagellama/pages/word_pack/word_pack_card.dart';
import 'package:languagellama/pages/word_pack/word_pack_event.dart';
import 'package:languagellama/pages/word_pack/word_pack_state.dart';
import 'package:languagellama/repository/repository.dart';
import 'package:languagellama/widgets/llama_menu_widget.dart';

class WordPackUi extends StatelessWidget {
  const WordPackUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WordPackBloc(context.read<Repository>())..add(LoadPacks()),
      child: Builder(
        builder: (context) => LlamaMenuWidget(
          child: BlocBuilder<WordPackBloc, WordPackState>(
            builder: (context, state) {
              if (state is WordPackReady) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Choose a word pack',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    ...state.packs.map((e) => WordPackCard(
                      name: e.name,
                      onTapped: () => GoRouter.of(context).go('/wordPack/play', extra: e.id)
                    ))
                  ],
                );
              } else if (state is WordPackLoading) {
                return const Center(child: CircularProgressIndicator(),);
              } else {
                return const SizedBox.shrink();
              }
            }
          )
        ),
      ),
    );
  }
}
