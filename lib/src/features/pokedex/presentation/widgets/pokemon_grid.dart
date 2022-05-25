import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokemon_test/src/core/dependencies/dependencies.dart';
import 'package:pokemon_test/src/core/theme/colors.dart';
import 'package:pokemon_test/src/core/theme/type.dart';
import 'package:pokemon_test/src/core/utils/int_extension.dart';
import 'package:pokemon_test/src/core/utils/string_extension.dart';

class PokemonGrid extends ConsumerWidget {
  const PokemonGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokedex = ref.watch(pokedexProvider);
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20.h,
        crossAxisSpacing: 20.w,
      ),
      itemCount: pokedex.pokemons.length,
      itemBuilder: (context, index) {
        return NeumorphicButton(
            onPressed: () {},
            style: const NeumorphicStyle(
              depth: 10,
              shadowLightColor: UiColors.backgroundColor,
            ),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Center(
                  child: Column(
                    children: [
                      Expanded(
                        child: CachedNetworkImage(
                          imageUrl: pokedex.pokemons[index].imageUrl,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        pokedex.pokemons[index].name.upperCaseFirst,
                        style: normalText,
                      ),
                      const SizedBox(height: 5),
                    ],
                  ),
                ),
                Positioned(
                  child: Text(
                    pokedex.pokemons[index].id.formatPokeId(),
                    style: smallText,
                  ),
                ),
                Positioned(
                  top: -10.h,
                  right: -10.w,
                  child: IconButton(
                    onPressed: () {
                      ref
                          .read(pokedexProvider.notifier)
                          .onSelectFavorite(index + 1);
                    },
                    icon: Icon(
                      Icons.favorite,
                      color: pokedex.pokemons[index].isFavorite
                          ? UiColors.secondaryColor
                          : Colors.white,
                    ),
                  ),
                ),
              ],
            ));
      },
    );
  }
}
