import 'dart:math';

import 'package:flutter/material.dart';


class Panel extends StatelessWidget {
  const Panel({
    required this.child,
    required this.width,
    required this.height,
    required this.visible,
    required this.onTap,
    required this.color,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final double width;
  final double height;
  final bool visible;
  final void Function() onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    const animationDuration = 300;
    final delayDuration = Random().nextInt(800);
    return GestureDetector(
      onTap: onTap,
      child: AnimatedOpacity(
          opacity: visible ? 1.0 : 0.0,
          curve: visible ? Interval(delayDuration / (delayDuration + animationDuration), 1.0) : Curves.linear,
          duration: Duration(milliseconds: visible ? animationDuration + delayDuration: animationDuration),
          child: SizedBox(
              height: height,
              width: width,
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.deepPurple,
                        offset: Offset(-2, 4),
                        blurRadius: 10,
                        spreadRadius: -1,
                      ),
                    ],
                    color: color,
                  ),
                  padding: const EdgeInsets.fromLTRB(0, 25, 0, 25),
                  margin: const EdgeInsets.all(10), // prevents shadow clipping
                  alignment: Alignment.center,
                  child: child
              )
          )
      ),
    );
  }
}
