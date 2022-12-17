

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:languagellama/pages/change_password/change_password_bloc.dart';
import 'package:languagellama/pages/change_password/change_password_event.dart';
import 'package:languagellama/pages/change_password/change_password_state.dart';
import 'package:languagellama/repository/repository.dart';
import 'package:languagellama/widgets/llama_menu_widget.dart';
import 'package:languagellama/widgets/standard_button.dart';

class ChangePasswordUi extends StatelessWidget {
  const ChangePasswordUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (context) => ChangePasswordBloc(context.read<Repository>()),
    child: Builder(
      builder: (context) => LlamaMenuWidget(
        appBar: AppBar(title: const Text("Reset Password"),),
        child: BlocListener<ChangePasswordBloc, ChangePasswordState>(
          listener: (context, state) {
            if (state is ChangePasswordStateReady && state.message != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message!),
                ),
              );
            }
          },
          child: BlocBuilder<ChangePasswordBloc, ChangePasswordState>(
            builder: (context, state) {
              if (state is ChangePasswordStateReady) {
                final textController = TextEditingController();
                return Form(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: textController,
                        decoration: const InputDecoration(
                          labelText: 'New Password',
                        ),
                        obscureText: true,
                      ),
                      const SizedBox(height: 20,),
                      StandardButton(
                        onPressed: () {
                          BlocProvider.of<ChangePasswordBloc>(context).add(ChangePassword(textController.text));
                        },
                        title: 'Reset Password',
                      ),
                    ],
                  ),
                );
              } else {
                return const Center(child: CircularProgressIndicator(),);
              }
            },
          ),
        ),
      )
    )
  );
}
