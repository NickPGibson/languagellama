

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:languagellama/pages/reset_password/reset_password_bloc.dart';
import 'package:languagellama/pages/reset_password/reset_password_event.dart';
import 'package:languagellama/pages/reset_password/reset_password_state.dart';
import 'package:languagellama/repository/repository.dart';
import 'package:languagellama/widgets/llama_menu_widget.dart';
import 'package:languagellama/widgets/standard_button.dart';

class ResetPasswordUi extends StatelessWidget {
  const ResetPasswordUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ResetPasswordBloc(context.read<Repository>()),
      child: Builder(
        builder: (context) {
          return LlamaMenuWidget(
            appBar: AppBar(title: const Text("Reset Password"),),
            child: BlocListener<ResetPasswordBloc, ResetPasswordState>(
              listener: (context, state) {
                if (state is ResetPasswordStateReady && state.message != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.message!),
                    ),
                  );
                }
              },
              child: BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
                builder: (context, state) {
                  if (state is ResetPasswordStateReady) {
                    final textController = TextEditingController();
                    return Form(
                      child: Column(
                        children: [
                          TextFormField(
                            controller: textController,
                            decoration: const InputDecoration(
                              labelText: 'Email',
                            ),
                          ),
                          const SizedBox(height: 20,),
                          StandardButton(
                            onPressed: () {
                              BlocProvider.of<ResetPasswordBloc>(context).add(ResetPassword(textController.text));
                            },
                            title: 'Reset Password',
                          ),
                        ],
                      ),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator(),);
                  }
                }
              )
            )
          );
        }
      )
    );
  }
}
