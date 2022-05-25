import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pokemon_test/generated/l10n.dart';
import 'package:pokemon_test/src/core/theme/colors.dart';
import 'package:pokemon_test/src/core/theme/type.dart';

class FavoriteButton extends ConsumerWidget {
  const FavoriteButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return NeumorphicButton(
      onPressed: () {
        context.go('/home/favorites');
      },
      style: const NeumorphicStyle(
        color: UiColors.primaryColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            S.of(context).favorites,
            style: h3.copyWith(
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            width: 30,
            height: 30,
            child: Image.asset("assets/images/heart_pokeball.png"),
          ),
        ],
      ),
    );
  }
}
