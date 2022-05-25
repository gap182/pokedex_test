import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_test/src/core/domain/entities/pokemon_entity.dart';
import 'package:pokemon_test/src/core/domain/repositories/pokemon_repository.dart';
import 'package:pokemon_test/src/features/pokedex/presentation/states/pokedex_state.dart';

class PokedexNotifier extends StateNotifier<PokedexState> {
  PokedexNotifier(this.repository)
      : super(
          PokedexState(
            pokemons: [],
            pokedexStatus: PokedexStatus.loading,
          ),
        );

  final PokemonRepository repository;

  void loadPokemonsInfo({int init = 1, required int end}) async {
    state = state.copyWith(pokemons: []);
    state = state.copyWith(pokedexStatus: PokedexStatus.loading);
    for (int i = init; i <= end; i++) {
      final response = await repository.getPokemonInfo(i.toString());

      if (response.response != null && response.error == null) {
        final currentPokemons = state.pokemons;
        currentPokemons.add(response.response!);
        state = state.copyWith(pokemons: currentPokemons);
      }
    }
    state = state.copyWith(pokedexStatus: PokedexStatus.done);
  }

  void onSelectFavorite(int id) {
    final currentPokemons = <PokemonEntity>[];
    final selectedPokemon =
        state.pokemons.firstWhere((element) => element.id == id);

    final newPokemon =
        selectedPokemon.copyWith(isFavorite: !selectedPokemon.isFavorite);

    for (var element in state.pokemons) {
      if (element.id != id) {
        currentPokemons.add(element);
      }
    }

    currentPokemons.add(newPokemon);

    currentPokemons.sort((a, b) => a.id.compareTo(b.id));

    state = state.copyWith(pokemons: currentPokemons);
  }
}
