
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:languagellama/pages/error_report/error_report_bloc.dart';
import 'package:languagellama/pages/error_report/error_report_event.dart';
import 'package:languagellama/pages/error_report/error_report_state.dart';
import 'package:languagellama/repository/repository.dart';
import 'package:languagellama/widgets/contact_form.dart';
import 'package:languagellama/widgets/llama_menu_widget.dart';

class ErrorReportUi extends StatelessWidget {

  final String packId;

  const ErrorReportUi({required this.packId, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ErrorReportBloc(context.read<Repository>()),
      child: Builder(
        builder: (context) => BlocListener<ErrorReportBloc, ErrorReportState>(
          listener: (context, state) {
            if (state is ErrorReportStateReady && state.message != null) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message!)));
            }
          },
          child: BlocBuilder<ErrorReportBloc, ErrorReportState>(
            builder: (context, state) {
              if (state is ErrorReportStateReady) {
                return LlamaMenuWidget(
                  appBar: AppBar(
                    title: const Text("Report error"),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Please describe the error you encountered.", style: Theme.of(context).textTheme.subtitle1,),
                      const SizedBox(height: 5,),
                      ContactForm(
                        onSend: (text) {
                          BlocProvider.of<ErrorReportBloc>(context).add(SendErrorReport(message: text, packId: packId));
                        },
                      )
                    ],
                  )
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          )
        )
      ),
    );
  }
}
