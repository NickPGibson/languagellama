

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:languagellama/pages/account_settings/account_settings_bloc.dart';
import 'package:languagellama/pages/account_settings/account_settings_event.dart';
import 'package:languagellama/pages/account_settings/account_settings_state.dart';
import 'package:languagellama/repository/repository.dart';
import 'package:languagellama/widgets/llama_menu_widget.dart';
import 'package:languagellama/widgets/rounded_card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
              title: Text(AppLocalizations.of(context)!.settings),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                RoundedCard(
                  child: ListTile(
                    leading: const Icon(Icons.password_outlined),
                    title: Text(AppLocalizations.of(context)!.changePassword),
                  ),
                  onTapped: () {
                    GoRouter.of(context).go('/settings/change_password');
                  }
                ),
                RoundedCard(
                  child: ListTile(
                    leading: const Icon(Icons.delete_outline_outlined),
                    title: Text(AppLocalizations.of(context)!.deleteAccount),
                  ),
                  onTapped: () {
                    showDialog(
                      context: builderContext,
                      builder: (context) => AlertDialog(
                        title: Text(AppLocalizations.of(context)!.areYouSure),
                        content: SingleChildScrollView(
                          child: Text(AppLocalizations.of(context)!.accountWilBeDeleted),
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: Text(AppLocalizations.of(context)!.cancel),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                          TextButton(
                            child: Text(AppLocalizations.of(context)!.deleteAccount),
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
