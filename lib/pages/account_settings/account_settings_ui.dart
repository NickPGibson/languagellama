

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:languagellama/pages/account_settings/account_settings_bloc.dart';
import 'package:languagellama/pages/account_settings/account_settings_event.dart';
import 'package:languagellama/pages/account_settings/account_settings_state.dart';
import 'package:languagellama/repository/repository.dart';
import 'package:languagellama/widgets/llama_menu_widget.dart';
import 'package:languagellama/widgets/rounded_card.dart';

class AccountSettingsUi extends StatelessWidget {
  const AccountSettingsUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AccountSettingsBloc(context.read<Repository>()),
      child: Builder(
        builder: (builderContext) => BlocListener<AccountSettingsBloc, AccountSettingsState>(
          listener: (context, state) {
            if (state is AccountSettingsReady && state.message != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message!),
                ),
              );
            }
          },
          child: LlamaMenuWidget(
            appBar: AppBar(
              title: const Text('Settings'),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                RoundedCard(
                  child: const ListTile(
                    leading: Icon(Icons.password_outlined),
                    title: Text("Change Password"),
                  ),
                  onTapped: () {
                    GoRouter.of(context).go('/change_password');
                  }
                ),
                RoundedCard(
                  child: const ListTile(
                    leading: Icon(Icons.delete_outline_outlined),
                    title: Text("Delete Account"),
                  ),
                  onTapped: () {
                    showDialog(
                      context: builderContext,
                      builder: (context) => AlertDialog(
                        title: const Text("Are you sure?"),
                        content: const SingleChildScrollView(
                          child: Text("Your account will be deleted permanently. This cannot be undone."),
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: const Text("Cancel"),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                          TextButton(
                            child: const Text("Delete Account"),
                            onPressed: () {
                              BlocProvider.of<AccountSettingsBloc>(builderContext).add(const DeleteAccountPressed());
                              Navigator.of(context).pop();
                            },
                          )
                        ],
                      )
                    );
                  }
                ),
              ],
            )
          ),
        ),
      )
    );
  }
}
