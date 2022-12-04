

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:languagellama/repository/repository.dart';
import 'package:languagellama/widgets/box_decoration.dart';
import 'package:languagellama/widgets/options/options_bloc.dart';
import 'package:languagellama/widgets/options/options_event.dart';
import 'package:languagellama/widgets/options/options_state.dart';

class OptionsUi extends StatelessWidget {
  const OptionsUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OptionsBloc(context.read<Repository>())..add(const InitOptions()),
      child: Builder(
        builder: (context) => Drawer(
          child:BlocBuilder<OptionsBloc, OptionsState>(
            builder: (context, state) {
              if (state is OptionsStateReady) {
                return ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    DrawerHeader(
                      decoration: getBoxDecoration(),
                      child: Column(
                        children: [
                          if (state.initial != null) CircleAvatar(
                            backgroundColor: Colors. lightBlue.shade600,
                            child: Text(state.initial!, style: const TextStyle(color: Colors.white),),
                          ),
                          const SizedBox(height: 10),
                          if (state.currentUser != null) Text(
                            state.currentUser!,
                            style: Theme.of(context).textTheme.subtitle1?.copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    ListTile(
                      leading: const Icon(Icons.settings_outlined),
                      title: const Text('Settings'),
                      onTap: () {
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.favorite_border_outlined),
                      title: const Text('About the app'),
                      onTap: () {
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.logout_outlined),
                      title: const Text('Sign Out'),
                      onTap: () {
                        BlocProvider.of<OptionsBloc>(context).add(SignOut());
                        Navigator.pop(context);
                      },
                    ),
                  ],
                );
              } else if (state is OptionsStateLoading) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return const SizedBox.shrink();
              }
            },
          )
        )
      )
    );
  }
}
