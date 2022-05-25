import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokemon_test/src/core/dependencies/dependencies.dart';
import 'package:pokemon_test/src/core/domain/entities/pokemon_entity.dart';
import 'package:pokemon_test/src/core/theme/colors.dart';
import 'package:pokemon_test/src/core/theme/type.dart';
import 'package:pokemon_test/src/core/utils/int_extension.dart';
import 'package:pokemon_test/src/core/utils/string_extension.dart';
import 'package:pokemon_test/src/core/utils/types_color.dart';
import 'package:pokemon_test/src/features/pokedex/presentation/widgets/show_pokemon.dart';

class PokemonCard extends ConsumerWidget {
  const PokemonCard({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final PokemonEntity pokemon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 150.h,
      width: 150.h,
      child: NeumorphicButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            isDismissible: true,
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            backgroundColor: Colors.white,
            builder: (context) => ShowPokemon(
              pokemon: pokemon,
            ),
          );
        },
        style: NeumorphicStyle(
            depth: 10,
            shadowLightColor: UiColors.backgroundColor,
            color: typesColor[pokemon.types[0]]?.withOpacity(0.2)),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Center(
              child: Column(
                children: [
                  Expanded(
                    child: CachedNetworkImage(
                      imageUrl: pokemon.imageUrl,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    pokemon.name.upperCaseFirst,
                    style: normalText,
                  ),
                  const SizedBox(height: 5),
                ],
              ),
            ),
            Positioned(
              child: Text(
                pokemon.id.formatPokeId(),
                style: smallText,
              ),
            ),
            Positioned(
              top: -10.h,
              right: -10.w,
              child: IconButton(onPressed: () {
                ref.read(pokedexProvider.notifier).onFavoriteSelection(pokemon);
              }, icon: Consumer(
                builder: (context, ref, child) {
                  final pokedex = ref.watch(pokedexProvider);
                  return Icon(
                    Icons.favorite,
                    color: pokedex.getFavoritesId().contains(pokemon.id)
                        ? UiColors.secondaryColor
                        : Colors.white,
                  );
                },
              )),
            ),
          ],
        ),
      ),
    );
  }
}
