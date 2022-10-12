

import 'package:flutter/material.dart';

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

  bool _isTappedDown = false;

  static const offset = 2.0;
  static const curveRadius = 30.0;

  void _onTapDown(_) {
    setState(() {
      _isTappedDown = true;
    });
  }

  void _onTapUp(_) {
    widget.onPressed();
    setState(() {
      _reset();
    });
  }

  void _onTapCancel() {
    setState(() {
      _reset();
    });
  }

  void _reset() {
    _isTappedDown = false;
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTapUp: _onTapUp,
    onTapDown: _onTapDown,
    onTapCancel: _onTapCancel,
    child: Material(
      elevation: _isTappedDown ? 0.0 : 5.0,
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
    ),
  );
}
