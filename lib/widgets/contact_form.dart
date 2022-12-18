

import 'package:flutter/material.dart';
import 'package:languagellama/widgets/input_decoration.dart';
import 'package:languagellama/widgets/standard_button.dart';

class ContactForm extends StatefulWidget {

  const ContactForm({required this.onSend, Key? key}) : super(key: key);

  final void Function(String message) onSend;

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {

  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            minLines: 10,
            maxLines: 10,
            decoration: getInputDecoration(hintText: "Enter your message here"),
            controller: _textController,
          ),
          const SizedBox(height: 20,),
          StandardButton(
            onPressed: () {
              widget.onSend(_textController.text);
              Navigator.of(context).pop();
            },
            title: "Send",
          )
        ],
      ),
    );
  }
}
