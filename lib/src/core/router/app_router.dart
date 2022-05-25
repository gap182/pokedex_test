import 'package:go_router/go_router.dart';
import 'package:pokemon_test/src/features/home/presentation/pages/home_page.dart';
import 'package:pokemon_test/src/features/pokedex/presentation/pages/favorites_page.dart';
import 'package:pokemon_test/src/features/pokedex/presentation/pages/pokedex_page.dart';
import 'package:pokemon_test/src/features/splash/presentation/pages/splash_page.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: 'splash',
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: '/home',
      name: 'home',
      builder: (context, state) => const HomePage(),
      routes: [
        GoRoute(
          path: 'pokedex',
          name: 'pokedex',
          builder: (context, state) => const PokedexPage(),
        ),
        GoRoute(
          path: 'favorites',
          name: 'favorites',
          builder: (context, state) => const FavoritePage(),
        ),
      ],
    ),
  ],
);
