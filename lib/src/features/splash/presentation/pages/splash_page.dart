import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pokemon_test/src/core/dependencies/dependencies.dart';
import 'package:pokemon_test/src/core/theme/colors.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    animationController =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    animation =
        Tween<double>(begin: 0.0, end: 200.0).animate(animationController);

    ref.read(configProvider.notifier).loadConfigData();

    animation.addListener(() {
      if (animation.isCompleted) {
        context.go('/home');
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    animationController.forward();

    return Scaffold(
      backgroundColor: UiColors.backgroundColor,
      body: Center(
        child: AnimatedBuilder(
          animation: animation,
          builder: (context, child) {
            return SizedBox(
              height: animation.value,
              width: animation.value,
              child: child,
            );
          },
          child: const _PokeBall(),
        ),
      ),
    );
  }
}

class _PokeBall extends StatelessWidget {
  const _PokeBall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset("assets/images/pokeball.png");
  }
}
