

import 'package:flutter/material.dart';
import 'package:languagellama/widgets/tappable.dart';

class StandardButton extends StatefulWidget {
  const StandardButton({
    this.width, // will dynamically size its width if null, otherwise will use this width
    this.height, // will dynamically size its height if null, otherwise will use this height
    required this.onPressed,
    required this.title,
    Key? key,
  }) : super(key: key);

  final double? width;
  final double? height;
  final VoidCallback onPressed;
  final String title;

  @override
  State<StandardButton> createState() => _StandardButtonState();
}

class _StandardButtonState extends State<StandardButton> {

  static const offset = 2.0;
  static const curveRadius = 30.0;

  @override
  Widget build(BuildContext context) => Tappable(
    builder: (elevation) => Material(
      elevation: elevation,
      borderRadius: BorderRadius.circular(curveRadius),
      shadowColor: Colors.black,
      color: Colors.transparent,
      child: Container(
        width: widget.width,
        height: widget.height,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: const Offset(-offset, -offset),
              spreadRadius: 0.0,
              blurRadius: 2.0,
              color: Colors.deepPurple[300]!.withOpacity(0.3)
            ),
          ],
          color: Colors.deepPurple,
          border: Border.all(color: Colors.deepPurple, width: 0.5),
          borderRadius: BorderRadius.circular(curveRadius),
        ),
        alignment: Alignment.center,
        child: Text(
          widget.title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
    ), onTapped: () {
      widget.onPressed();
    },
  );
}
