

import 'package:flutter/material.dart';

class Tappable extends StatefulWidget {

  final Widget Function(double elevation) builder;
  final void Function() onTapped;

  const Tappable({required this.builder, required this.onTapped, Key? key}) : super(key: key);

  @override
  State<Tappable> createState() => _TappableState();
}

class _TappableState extends State<Tappable> {

  bool _isTappedDown = false;

  void _onTapDown(_) {
    setState(() {
      _isTappedDown = true;
    });
  }

  void _onTapUp(_) {
    widget.onTapped();
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
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: _onTapUp,
      onTapDown: _onTapDown,
      onTapCancel: _onTapCancel,
      child: widget.builder(_isTappedDown ? 0.0 : 5.0),
    );
  }
}
