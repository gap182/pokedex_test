part of 'dependencies.dart';

final pokedexProvider =
    StateNotifierProvider<PokedexNotifier, PokedexState>((ref) {
  final repository = ref.watch(pokemonRepositoryImplProvider);
  return PokedexNotifier(repository, ref);
});

final tabSelectionProvider = StateProvider<SelectionTabState>((ref) {
  return SelectionTabState(indexSelected: 0);
});
