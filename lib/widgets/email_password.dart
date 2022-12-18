

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:languagellama/widgets/input_decoration.dart';
import 'package:languagellama/widgets/standard_button.dart';

class EmailPassword extends StatefulWidget {
  
  final void Function(String email, String password) onComplete;
  final FormFieldValidator<String>? passwordValidator;
  final String buttonText;

  const EmailPassword({required this.onComplete, this.passwordValidator, required this.buttonText, super.key});

  @override
  State<EmailPassword> createState() => _EmailPasswordState();
}

class _EmailPasswordState extends State<EmailPassword> {

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  
  @override
  Widget build(BuildContext context) => Form(
    key: _formKey,
    child: Column(
      children: [
        TextFormField(
          controller: _emailController,
          textInputAction: TextInputAction.next,
          decoration: getInputDecoration(label: "Email Address"),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (email) => email != null && !EmailValidator.validate(email) ? "Enter a valid email address" : null,
          style: const TextStyle(color: Colors.black), // text colour
        ),
        const SizedBox(height: 10,),
        TextFormField(
          controller: _passwordController,
          textInputAction: TextInputAction.done,
          decoration: getInputDecoration(label: "Password"),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          obscureText: true,
          validator: widget.passwordValidator,
          style: const TextStyle(color: Colors.black), // text colour
        ),
        const SizedBox(height: 20,),
        StandardButton(
          onPressed: () => widget.onComplete(_emailController.text, _passwordController.text),
          title: widget.buttonText,
        )
      ]
    ),
  );
}
