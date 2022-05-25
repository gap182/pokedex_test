import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokemon_test/src/core/domain/entities/pokemon_entity.dart';
import 'package:pokemon_test/src/features/pokedex/presentation/widgets/pokemon_card.dart';

class PokemonGrid extends ConsumerWidget {
  const PokemonGrid({Key? key, this.pokemonList = const []}) : super(key: key);

  final List<PokemonEntity> pokemonList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GridView.builder(
      physics: const ClampingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 30),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20.h,
        crossAxisSpacing: 20.w,
      ),
      itemCount: pokemonList.length,
      itemBuilder: (context, index) {
        return PokemonCard(pokemon: pokemonList[index]);
      },
    );
  }
}
