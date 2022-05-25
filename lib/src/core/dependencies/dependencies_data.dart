part of 'dependencies.dart';

final pokemonServiceProvider = Provider<PokemonService>((ref) {
  final dio = ref.watch(dioProvider);
  return PokemonService(dio: dio);
});
