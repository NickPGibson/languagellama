
import 'package:flutter/material.dart';
import 'package:languagellama/widgets/tappable.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WordPackCard extends StatefulWidget {

  final String name;
  final int? highScore;
  final void Function() onTapped;

  const WordPackCard({required this.name, this.highScore, required this.onTapped, Key? key}) : super(key: key);

  @override
  State<WordPackCard> createState() => _WordPackCardState();
}

class _WordPackCardState extends State<WordPackCard> {

  @override
  Widget build(BuildContext context) {
    return Tappable(
      builder: (elevation) => Card(
        elevation: elevation,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Text(widget.name, style: Theme.of(context).textTheme.headlineSmall,),
              Text(widget.highScore != null ? AppLocalizations.of(context)!.highScore(widget.highScore!) : AppLocalizations.of(context)!.notPlayed, style: Theme.of(context).textTheme.bodyMedium,)
            ]
          ),
        ),
      ),
      onTapped: widget.onTapped,
    );
  }
}
