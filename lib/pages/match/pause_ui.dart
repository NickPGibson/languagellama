

import 'package:flutter/material.dart';
import 'package:languagellama/pages/error_report/error_report_ui.dart';
import 'package:languagellama/widgets/llama_game_widget.dart';
import 'package:languagellama/widgets/standard_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PauseUi extends StatelessWidget {

  final void Function() onResume;
  final void Function() onExit;
  final String packId;

  const PauseUi({Key? key, required this.onResume, required this.onExit, required this.packId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: LlamaGameWidget(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(AppLocalizations.of(context)!.paused, style: Theme.of(context).textTheme.headline5,),
            const SizedBox(height: 20,),
            StandardButton(title: AppLocalizations.of(context)!.resume, onPressed: () {
              onResume();
              Navigator.of(context).pop();
            }),
            const SizedBox(height: 20,),
            StandardButton(
              title: AppLocalizations.of(context)!.reportError,
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    //fullscreenDialog: true,
                    builder: (context) => ErrorReportUi(packId: packId),
                  )
                );
              }
            ),
            const SizedBox(height: 20,),
            StandardButton(title: AppLocalizations.of(context)!.exit, onPressed: () {
              onExit();
              Navigator.of(context).pop();
            }),
          ],
        )
    ),
    onWillPop: () async {
      onResume();
      return true;
    });
  }
}
