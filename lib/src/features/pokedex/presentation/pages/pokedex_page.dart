import 'package:flutter/scheduler.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokemon_test/generated/l10n.dart';
import 'package:pokemon_test/src/core/dependencies/dependencies.dart';
import 'package:pokemon_test/src/core/presentation/widgets/common_appbar.dart';
import 'package:pokemon_test/src/core/presentation/widgets/custom_loading.dart';
import 'package:pokemon_test/src/core/theme/colors.dart';
import 'package:pokemon_test/src/core/theme/type.dart';
import 'package:pokemon_test/src/features/pokedex/presentation/states/pokedex_state.dart';
import 'package:pokemon_test/src/features/pokedex/presentation/widgets/pikachu_image.dart';
import 'package:pokemon_test/src/features/pokedex/presentation/widgets/pokemon_grid.dart';

class PokedexPage extends ConsumerStatefulWidget {
  const PokedexPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PokedexPageState();
}

class _PokedexPageState extends ConsumerState<PokedexPage> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {});

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final pokedex = ref.watch(pokedexProvider);

    final topSearchPokemon =
        ref.watch(configProvider.select((value) => value.topLimitPokemons));

    return Stack(
      children: [
        Scaffold(
          backgroundColor: UiColors.backgroundColor,
          appBar: commonAppbar(context, title: "Pokedex"),
          body: Stack(
            fit: StackFit.expand,
            children: [
              Positioned(
                top: -80.h,
                right: -80.w,
                child: Image.asset(
                  'assets/images/pokeball_grey.png',
                  color: Colors.grey.withOpacity(0.2),
                ),
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      S.of(context).pokedexTitle(topSearchPokemon),
                      style: h1,
                    ),
                  ),
                  const PikachuImage(),
                  if (pokedex.pokedexStatus == PokedexStatus.done)
                    Expanded(
                      child: SafeArea(
                        child: PokemonGrid(
                          pokemonList: pokedex.pokemons,
                        ),
                      ),
                    ),
                ],
              )
            ],
          ),
        ),
        if (pokedex.pokedexStatus == PokedexStatus.loading)
          const CustomLoading(),
      ],
    );
  }
}
