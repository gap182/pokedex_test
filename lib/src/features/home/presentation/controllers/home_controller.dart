import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_test/src/core/domain/repositories/pokemon_repository.dart';
import 'package:pokemon_test/src/features/home/presentation/states/home_state.dart';

enum HomeStatus { initial, loading, done }

class HomeNotifier extends StateNotifier<HomeState> {
  HomeNotifier(this.repository) : super(HomeState());

  final PokemonRepository repository;

  void searchPokemon(String id) async {
    state = state.copyWith(homeStatus: HomeStatus.loading);
    final response = await repository.getPokemonInfo(id);

    if (response.response != null && response.error == null) {
      state = state.copyWith(
          pokemonSearchResult: () => response.response,
          errorHandler: () => null);
    } else {
      state = state.copyWith(
          pokemonSearchResult: () => null, errorHandler: () => response.error);
    }

    state = state.copyWith(homeStatus: HomeStatus.done);
  }

  void changeTextToSearch(String text) {
    state = state.copyWith(textToSearch: text);
  }
}
