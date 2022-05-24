import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_test/src/core/theme/colors.dart';
import 'package:pokemon_test/src/core/theme/type.dart';

class PokedexButton extends ConsumerWidget {
  const PokedexButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return NeumorphicButton(
      onPressed: () {},
      style: const NeumorphicStyle(
        color: UiColors.secondaryColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Pokedex",
            style: h3.copyWith(
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          SizedBox(
            width: 30,
            height: 30,
            child: Image.asset("assets/images/pokeball.png"),
          ),
        ],
      ),
    );
  }
}
