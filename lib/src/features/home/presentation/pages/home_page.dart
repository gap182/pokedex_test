import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokemon_test/generated/l10n.dart';
import 'package:pokemon_test/src/core/dependencies/dependencies.dart';
import 'package:pokemon_test/src/core/presentation/widgets/custom_loading.dart';
import 'package:pokemon_test/src/core/theme/colors.dart';
import 'package:pokemon_test/src/core/theme/type.dart';
import 'package:pokemon_test/src/features/home/presentation/controllers/home_controller.dart';
import 'package:pokemon_test/src/features/home/presentation/widgets/favorites_button.dart';
import 'package:pokemon_test/src/features/home/presentation/widgets/pokedex_button.dart';
import 'package:pokemon_test/src/features/home/presentation/widgets/search_widget.dart';
import 'package:pokemon_test/src/features/pokedex/presentation/widgets/not_found_pokemon.dart';
import 'package:pokemon_test/src/features/pokedex/presentation/widgets/pokemon_card.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    ref
        .read(pokedexProvider.notifier)
        .loadPokemonsInfo(end: ref.read(configProvider).topLimitPokemons);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final status = ref.watch(homeProvider.select((value) => value.homeStatus));
    final homePod = ref.watch(homeProvider);
    return Stack(
      children: [
        Scaffold(
          backgroundColor: UiColors.backgroundColor,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SafeArea(
                      child: Column(
                        children: [
                          const SizedBox(height: 30),
                          Text(S.of(context).homeTitle, style: h1),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        const SearchWidget(),
                        const SizedBox(
                          height: 20,
                        ),
                        if (homePod.pokemonSearchResult != null)
                          PokemonCard(pokemon: homePod.pokemonSearchResult!),
                        if (homePod.pokemonSearchResult == null &&
                            homePod.error != null)
                          const NotFoundPokemon(),
                        const SizedBox(height: 20),
                        const PokedexButton(),
                        const SizedBox(
                          height: 40,
                        ),
                        const FavoriteButton(),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 100.h,
                          width: double.infinity,
                          child: Image.asset(
                            "assets/images/pokemon_meet.png",
                            fit: BoxFit.fill,
                          ),
                        ),
                        const SizedBox(height: 30),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        if (status == HomeStatus.loading) const CustomLoading()
      ],
    );
  }
}
