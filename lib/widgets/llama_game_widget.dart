
import 'package:flutter/material.dart';
import 'package:languagellama/widgets/animation_utils.dart';

class LlamaGameWidget extends StatefulWidget {

  final Widget child;

  const LlamaGameWidget({required this.child, super.key});

  @override
  State<LlamaGameWidget> createState() => _LlamaGameWidgetState();
}

class _LlamaGameWidgetState extends State<LlamaGameWidget> with TickerProviderStateMixin {

  final DecorationTween decorationTween = getLlamaDecorationTween();

  late final AnimationController _controller = getAnimationController(this);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBoxTransition(
        decoration: decorationTween.animate(_controller),
        child: SizedBox(
          width: double.maxFinite,
          height: double.maxFinite,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: widget.child,
            ),
          )
        )
      )
    );
  }
}
