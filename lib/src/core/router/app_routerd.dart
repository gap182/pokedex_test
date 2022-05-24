import 'package:go_router/go_router.dart';
import 'package:pokemon_test/src/features/home/presentation/pages/home_page.dart';
import 'package:pokemon_test/src/features/splash/presentation/pages/splash_page.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomePage(),
    ),
  ],
);
