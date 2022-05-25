part of 'dependencies.dart';

final pokemonRepositoryImplProvider = Provider<PokemonRepository>((ref) {
  final service = ref.watch(pokemonServiceProvider);
  return PokemonRepositoryImpl(service);
});
