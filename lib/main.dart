import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:languagellama/pages/account_settings/account_settings_ui.dart';
import 'package:languagellama/pages/change_password/change_password_ui.dart';
import 'package:languagellama/pages/contact_us/contact_us_ui.dart';
import 'package:languagellama/pages/create_account/create_account_ui.dart';
import 'package:languagellama/pages/game_finished/game_finished_ui.dart';
import 'package:languagellama/pages/init/init_bloc.dart';
import 'package:languagellama/pages/init/init_event.dart';
import 'package:languagellama/pages/init/init_ui.dart';
import 'package:languagellama/pages/login/login_ui.dart';
import 'package:languagellama/pages/match/game_summary.dart';
import 'package:languagellama/pages/match/match.dart';
import 'package:languagellama/pages/reset_password/reset_password_ui.dart';
import 'package:languagellama/repository/repository.dart';
import 'package:languagellama/widgets/transition.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.edgeToEdge,
  );
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
    // if we get an error saying A Firebase App named "[DEFAULT]" already exists, then usually flutter clean or rebuilding will solve it.
    // Alternatively, can add name argument here (see below), although this seems to break web support so don't actually do this. Only spent 2.5 hours figuring this out.
    //name: "language-llama"
  );
  runApp(const LanguageLlamaApp());
}

class LanguageLlamaApp extends StatelessWidget {
  const LanguageLlamaApp({super.key});

  static final _router = GoRouter(
    redirect: (context, state) {
      final path = state.location;
      final userIsLoggedIn = context.read<Repository>().getUser() != null;
      final loggedOutPages = {"/login", "/createAccount", "/reset_password"};
      final pageRequiresAuth = !loggedOutPages.contains(path);
      if (path != "/" && (userIsLoggedIn ^ pageRequiresAuth)) {
        return "/";
      } else {
        return null;
      }
    },
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const InitUi(),
        routes: [
          GoRoute(
            path: 'play',
            pageBuilder: (context, state) => buildMyTransition<void>(
              child: MatchUi(packId: state.extra as String),
              color: Colors.deepPurple,
            ),
          ),
          GoRoute(
            path: 'finished',
            pageBuilder: (context, state) => buildMyTransition<void>(
              child: GameFinishedUi(summary: state.extra as GameSummary),
              color: Colors.deepPurple,
            )
          ),
          GoRoute(
            path: 'createAccount',
            pageBuilder: (context, state) => buildMyTransition<void>(
              child: const CreateAccountUi(),
              color: Colors.deepPurple,
            )
          ),
          GoRoute(
            path: 'login',
            pageBuilder: (context, state) => buildMyTransition<void>(
              child: const LoginUi(),
              color: Colors.deepPurple,
            )
          ),
          GoRoute(
            path: 'settings',
            pageBuilder: (context, state) => buildMyTransition<void>(
              child: const AccountSettingsUi(),
              color: Colors.deepPurple,
            ),
            routes: [
              GoRoute(
                  path: 'change_password',
                  pageBuilder: (context, state) => buildMyTransition<void>(
                    child: const ChangePasswordUi(),
                    color: Colors.deepPurple,
                  )
              ),
            ]
          ),
          GoRoute(
            path: 'reset_password',
            pageBuilder: (context, state) => buildMyTransition<void>(
              child: const ResetPasswordUi(),
              color: Colors.deepPurple,
            )
          ),
          GoRoute(
            path: 'contact_us',
            pageBuilder: (context, state) => buildMyTransition<void>(
              child: const ContactUsUi(),
              color: Colors.deepPurple,
            )
          ),
        ],
      )
    ]
  );

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Repository>(
          create: (context) => Repository(),
        )
      ],
      child: Builder(
        builder: (context) => BlocProvider(
          create: (context) => InitBloc(context.read<Repository>())..add(StartApp()),
          child: MaterialApp.router(
            theme: ThemeData(
              fontFamily: 'Quicksand', // change to Figtree?
              appBarTheme: const AppBarTheme(titleTextStyle: TextStyle(fontFamily: "Pacifico", fontSize: 24), backgroundColor: Colors.deepPurple, foregroundColor: Colors.white, elevation: 0, systemOverlayStyle: SystemUiOverlayStyle.light),
            ),
            routeInformationProvider: _router.routeInformationProvider,
            routeInformationParser: _router.routeInformationParser,
            routerDelegate: _router.routerDelegate,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
          ),
        ),
      )
    );
  }
}
