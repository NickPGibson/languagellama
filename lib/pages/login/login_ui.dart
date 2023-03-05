

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:languagellama/pages/login/login_bloc.dart';
import 'package:languagellama/pages/login/login_event.dart';
import 'package:languagellama/pages/login/login_state.dart';
import 'package:languagellama/repository/repository.dart';
import 'package:languagellama/widgets/email_password.dart';
import 'package:languagellama/widgets/llama_menu_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginUi extends StatelessWidget {
  const LoginUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LlamaMenuWidget(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.login),
      ),
      child: BlocProvider(
        create: (context) => LoginBloc(context.read<Repository>()),
        child: Builder(
          builder: (context) => BlocListener<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state is LoginStateReady && state.message != null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message!),
                  ),
                );
              }
            },
            child: BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                if (state is LoginStateLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is LoginStateReady) {
                  return Column(
                    children: [
                      EmailPassword(
                        buttonText: AppLocalizations.of(context)!.login,
                        onComplete: (email, password) => BlocProvider.of<LoginBloc>(context).add(DoLogin(email: email, password: password)),
                      ),
                      const SizedBox(height: 20,),
                      TextButton(
                        onPressed: () => GoRouter.of(context).go('/reset_password'),
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                        ),
                        child: Text(AppLocalizations.of(context)!.forgotPassword),
                      ),
                    ],
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            )
          ),
        ),
      ),
    );
  }
}
