
import 'package:flutter/material.dart';

DecorationTween getLlamaDecorationTween() => DecorationTween(
  begin: BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      colors: [
        Colors.lightBlue[100]!,
        Colors.lightBlue[200]!,
        Colors.lightBlue[400]!,
        Colors.lightBlue[600]!
      ]
    )
  ),
  end: BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      colors: [
        Colors.lightBlue[500]!,
        Colors.lightBlue[600]!,
        Colors.lightBlue[700]!,
        Colors.lightBlue[900]!
      ]
    )
  ),
);


AnimationController getAnimationController(TickerProvider tickerProvider) => AnimationController(
  vsync: tickerProvider,
  duration: const Duration(seconds: 3),
)..repeat(reverse: true);
