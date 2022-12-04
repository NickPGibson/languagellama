
import 'package:flutter/material.dart';
import 'package:languagellama/widgets/tappable.dart';

class RoundedCard extends StatelessWidget {

  final Widget child;
  final void Function() onTapped;

  const RoundedCard({required this.child, required this.onTapped, super.key});

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
          child: child,
        ),
      ),
      onTapped: onTapped,
    );
  }
}
