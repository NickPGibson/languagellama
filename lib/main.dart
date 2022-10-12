import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:languagellama/widgets/standard_button.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.edgeToEdge,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Quicksand',
        appBarTheme: const AppBarTheme(titleTextStyle: TextStyle(fontFamily: "Pacifico", fontSize: 24), backgroundColor: Colors.deepPurple, foregroundColor: Colors.white, elevation: 0, systemOverlayStyle: SystemUiOverlayStyle.light),
      ),
      home: const MyHomePage()
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {

  final DecorationTween decorationTween = DecorationTween(
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

  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 3),
  )..repeat(reverse: true);

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
                      Text(
                        'Welcome to Language Llama!',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      const SizedBox(height: 30,),
                      StandardButton(title: "Start", onPressed: () {}),
                    ],
                  ),
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
            ],
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
