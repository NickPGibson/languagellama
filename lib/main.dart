import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:languagellama/pages/game_finished/game_finished_ui.dart';
import 'package:languagellama/pages/main_menu/main_menu.dart';
import 'package:languagellama/pages/match/game_summary.dart';
import 'package:languagellama/pages/match/match.dart';
import 'package:languagellama/pages/word_pack/word_pack_ui.dart';
import 'package:languagellama/repository/repository.dart';
import 'package:languagellama/widgets/transition.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.edgeToEdge,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const MainMenu(key: Key('main menu')),
        routes: [
          GoRoute(
            path: 'wordPack',
            pageBuilder: (context, state) => buildMyTransition<void>(
              child: const WordPackUi(),
              color: Colors.deepPurple,
            ),
            routes: [
              GoRoute(
                path: 'play',
                pageBuilder: (context, state) => buildMyTransition<void>(
                  child: MatchUi(packId: state.extra as String),
                  color: Colors.deepPurple,
                ),
              ),
            ]
          ),
          GoRoute(
            path: 'finished',
            pageBuilder: (context, state) => buildMyTransition<void>(
              child: GameFinishedUi(summary: state.extra as GameSummary),
              color: Colors.deepPurple,
            )
          ),
        ],
      )
    ]
  );

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => Repository(),
      child: MaterialApp.router(
        theme: ThemeData(
          fontFamily: 'Quicksand',
          appBarTheme: const AppBarTheme(titleTextStyle: TextStyle(fontFamily: "Pacifico", fontSize: 24), backgroundColor: Colors.deepPurple, foregroundColor: Colors.white, elevation: 0, systemOverlayStyle: SystemUiOverlayStyle.light),
        ),
        routeInformationProvider: _router.routeInformationProvider,
        routeInformationParser: _router.routeInformationParser,
        routerDelegate: _router.routerDelegate,
      ),
    );
  }
}
