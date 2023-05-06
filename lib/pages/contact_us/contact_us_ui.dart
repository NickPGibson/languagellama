
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:languagellama/pages/contact_us/contact_us_bloc.dart';
import 'package:languagellama/pages/contact_us/contact_us_event.dart';
import 'package:languagellama/pages/contact_us/contact_us_state.dart';
import 'package:languagellama/repository/repository.dart';
import 'package:languagellama/widgets/contact_form.dart';
import 'package:languagellama/widgets/llama_menu_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ContactUsUi extends StatelessWidget {
  const ContactUsUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (context) => ContactUsBloc(context.read<Repository>()),
    child: Builder(
      builder: (context) => BlocListener<ContactUsBloc, ContactUsState>(
        listener: (context, state) {
          if (state is ContactUsReady && state.message != null) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message!)));
          }
        },
        child: BlocBuilder<ContactUsBloc, ContactUsState>(
          builder: (context, state) {
            return LlamaMenuWidget(
              appBar: AppBar(title: Text(AppLocalizations.of(context)!.contactUs),),
              child: Column(
                children: [
                  Text(AppLocalizations.of(context)!.pleaseUseTheBoxBelow, style: Theme.of(context).textTheme.titleMedium,),
                  const SizedBox(height: 5,),
                  ContactForm(
                    onSend: (message) {
                      BlocProvider.of<ContactUsBloc>(context).add(SendContactUsMessage(message));
                    },
                  )
                ],
              )
            );
          },
        ),
      ),
    )
  );
}
