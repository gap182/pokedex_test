import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_test/generated/l10n.dart';
import 'package:pokemon_test/src/core/dependencies/dependencies.dart';
import 'package:pokemon_test/src/core/presentation/widgets/common_appbar.dart';
import 'package:pokemon_test/src/features/pokedex/presentation/widgets/pokemon_grid.dart';

class FavoritePage extends ConsumerWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokedex = ref.watch(pokedexProvider);
    return Scaffold(
      appBar: commonAppbar(context, title: S.of(context).favorites),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: PokemonGrid(
                pokemonList: pokedex.favoritePokemons,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
