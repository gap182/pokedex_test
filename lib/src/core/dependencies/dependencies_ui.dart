part of 'dependencies.dart';

final pokedexProvider =
    StateNotifierProvider<PokedexNotifier, PokedexState>((ref) {
  final repository = ref.watch(pokemonRepositoryImplProvider);
  return PokedexNotifier(repository, ref);
});

final tabSelectionProvider = StateProvider<SelectionTabState>((ref) {
  return SelectionTabState(indexSelected: 0);
});

final homeProvider = StateNotifierProvider<HomeNotifier, HomeState>((ref) {
  final repository = ref.watch(pokemonRepositoryImplProvider);
  return HomeNotifier(repository);
});
