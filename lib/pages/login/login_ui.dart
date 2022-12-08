

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:languagellama/pages/login/login_bloc.dart';
import 'package:languagellama/pages/login/login_event.dart';
import 'package:languagellama/pages/login/login_state.dart';
import 'package:languagellama/repository/repository.dart';
import 'package:languagellama/widgets/email_password.dart';
import 'package:languagellama/widgets/llama_menu_widget.dart';

class LoginUi extends StatelessWidget {
  const LoginUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LlamaMenuWidget(
      appBar: AppBar(
        title: const Text('Login'),
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
                  return EmailPassword(
                    buttonText: 'Login',
                    onComplete: (email, password) => BlocProvider.of<LoginBloc>(context).add(DoLogin(email: email, password: password)),
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
