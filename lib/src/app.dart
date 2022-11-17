import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty/src/screens/character_detail_screen/character_detail_screen.dart';

import 'http/repositories/home/home_repository.dart';
import 'routes/routes.dart';
import 'screens/home_screen/bloc/home_bloc.dart';
import 'screens/home_screen/front/home_screen.dart';
import 'screens/splash_screen/splash_screen.dart';

/// The Widget that configures your application.
class BaseApp extends StatelessWidget {
  const BaseApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (_) => HomeRepository(),
      child: BlocProvider<HomeBloc>(
        create: (BuildContext context) => HomeBloc(
          homeRepository: context.read<HomeRepository>(),
        )..add(HomeScreenInitial()),
        child: const BaseAppContent(),
      ),
    );
  }
}

class BaseAppContent extends StatefulWidget {
  const BaseAppContent({
    Key? key,
  }) : super(key: key);

  @override
  _BaseBankAppContentState createState() => _BaseBankAppContentState();
}

class _BaseBankAppContentState extends State<BaseAppContent> {
  @override
  Widget build(BuildContext context) {
    // Glue the SettingsController to the MaterialApp.
    //
    // The AnimatedBuilder Widget listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.
    return MaterialApp(
      navigatorKey: BankRoutes.rootNavigatorKey,
      restorationScopeId: 'app',
      supportedLocales: const [
        Locale('en', ''), // English, no country code
        Locale('pt', 'BR'), // Portuguese, BR country code
      ],
      onGenerateRoute: (RouteSettings routeSettings) {
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) {
            switch (routeSettings.name) {
              case HomeScreen.routeName:
                return const HomeScreen();
              case CharacterDetailScreen.routeName:
                return const CharacterDetailScreen();
            }
            return const SplashScreen();
          },
        );
      },
    );
  }
}
