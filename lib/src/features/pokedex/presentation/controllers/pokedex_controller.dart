import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pokemon_test/src/core/dependencies/dependencies.dart';
import 'package:pokemon_test/src/core/domain/entities/pokemon_entity.dart';
import 'package:pokemon_test/src/core/domain/repositories/pokemon_repository.dart';
import 'package:pokemon_test/src/features/pokedex/presentation/states/pokedex_state.dart';

class PokedexNotifier extends StateNotifier<PokedexState> {
  PokedexNotifier(this.repository, this.ref)
      : super(
          PokedexState(
            pokemons: [],
            favoritePokemons: [],
          ),
        );

  final PokemonRepository repository;
  final Ref ref;

  void loadPokemonsInfo({int init = 1, required int end}) async {
    state = state.copyWith(pokedexStatus: PokedexStatus.loading);
    var box = await Hive.openBox('pokedex');
    final info = box.get('pokedex');
    final numberPokemons = ref.read(configProvider).topLimitPokemons;

    if (info == null) {
      await downloadData(init: init, end: end);
    } else {
      state = PokedexState.fromJson(info);
    }

    if (state.pokemons.length != numberPokemons) {
      await downloadData(init: init, end: end);
    }

    box.put('pokedex', state.toJson());

    state = state.copyWith(pokedexStatus: PokedexStatus.done);
  }

  Future<void> downloadData({int init = 1, required int end}) async {
    final currentPokemons = <PokemonEntity>[];
    for (int i = init; i <= end; i++) {
      final response = await repository.getPokemonInfo(i.toString());

      if (response.response != null && response.error == null) {
        currentPokemons.add(response.response!);
        state = state.copyWith(pokemons: currentPokemons);
      }
    }
    state = state.copyWith(pokemons: currentPokemons);
  }

  void onFavoriteSelection(PokemonEntity pokemon) async {
    var box = await Hive.openBox('pokedex');

    final newFavorites = <PokemonEntity>[];

    for (var element in state.favoritePokemons) {
      newFavorites.add(element);
    }

    if (state.getFavoritesId().contains(pokemon.id)) {
      newFavorites.removeWhere((element) => element.id == pokemon.id);
    } else {
      newFavorites.add(pokemon);
    }

    state = state.copyWith(favoritePokemons: newFavorites);

    box.put('pokedex', state.toJson());
  }
}
