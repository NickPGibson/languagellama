

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:languagellama/pages/create_account/create_account_bloc.dart';
import 'package:languagellama/pages/create_account/create_account_event.dart';
import 'package:languagellama/pages/create_account/create_account_state.dart';
import 'package:languagellama/repository/repository.dart';
import 'package:languagellama/widgets/email_password.dart';
import 'package:languagellama/widgets/llama_menu_widget.dart';

class CreateAccountUi extends StatefulWidget {
  const CreateAccountUi({Key? key}) : super(key: key);

  @override
  State<CreateAccountUi> createState() => _CreateAccountUiState();
}

class _CreateAccountUiState extends State<CreateAccountUi> {

  @override
  Widget build(BuildContext context) {
    const minPasswordLength = 8;
    return LlamaMenuWidget(
      appBar: AppBar(
        title: const Text("Create Account"),
      ),
      child: BlocProvider(
        create: (context) => CreateAccountBloc(context.read<Repository>()),
        child: Builder(
          builder: (context) => BlocListener<CreateAccountBloc, CreateAccountState>(
            listener: (context, state) {
              if (state is CreateAccountStateReady && state.message != null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message!),
                  ),
                );
              }
            },
            child: BlocBuilder<CreateAccountBloc, CreateAccountState>(
                builder: (context, state) {
                  if (state is CreateAccountStateReady) {
                    return EmailPassword(
                      buttonText: 'Create Account',
                      passwordValidator: (email) => email != null && email.length < minPasswordLength ? "Password must be at least $minPasswordLength characters" : null,
                      onComplete: (email, password) =>
                          BlocProvider.of<CreateAccountBloc>(context)
                              .add(CreateAccountPressed(email: email, password: password))
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator(),);
                  }
                }
            ),
          ),
        ),
      )
    );
  }
}
