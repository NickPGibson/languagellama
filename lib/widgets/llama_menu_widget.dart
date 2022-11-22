import 'package:flutter/material.dart';
import 'package:languagellama/widgets/animation_utils.dart';

class LlamaMenuWidget extends StatefulWidget {

  final Widget child;

  const LlamaMenuWidget({required this.child, super.key});

  @override
  State<LlamaMenuWidget> createState() => _LlamaMenuWidgetState();
}

class _LlamaMenuWidgetState extends State<LlamaMenuWidget> with TickerProviderStateMixin {

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
      appBar: AppBar(
        title: const Text("Language Llama", ),
      ),
      body: DecoratedBoxTransition(
        decoration: decorationTween.animate(_controller),
        child: SizedBox(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      const SizedBox(height: 100,),
                      widget.child
                    ]
                  )
                )
              ),
              ClipPath(
                clipper: CustomClipPath(),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      colors: [
                        Colors.deepPurple,
                        Colors.deepPurple[500]!,
                        Colors.deepPurple[600]!,
                        Colors.deepPurple[700]!
                      ]
                    )
                  ),
                  height: 100,
                ),
              ),
            ]
          )
        )
      )
    );
  }
}

class CustomClipPath extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    final width = size.width;
    final height = size.height;
    final path = Path();
    path.lineTo(0, height/2);
    path.quadraticBezierTo(width*0.25, height/2 - 50, width/2, height/2);
    path.quadraticBezierTo(width*0.75, height/2 + 50, width, height/2);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
