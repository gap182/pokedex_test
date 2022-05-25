part of 'dependencies.dart';

final pokedexProvider =
    StateNotifierProvider<PokedexNotifier, PokedexState>((ref) {
  final repository = ref.watch(pokemonRepositoryImplProvider);
  return PokedexNotifier(repository);
});
