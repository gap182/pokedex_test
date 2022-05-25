import 'package:pokemon_test/src/core/domain/entities/pokemon_entity.dart';

enum PokedexStatus { loading, done }

class PokedexState {
  final List<PokemonEntity> pokemons;
  final PokedexStatus pokedexStatus;
  PokedexState({
    required this.pokemons,
    required this.pokedexStatus,
  });

  PokedexState copyWith({
    List<PokemonEntity>? pokemons,
    PokedexStatus? pokedexStatus,
  }) {
    return PokedexState(
      pokemons: pokemons ?? this.pokemons,
      pokedexStatus: pokedexStatus ?? this.pokedexStatus,
    );
  }

  @override
  String toString() => 'PokedexState(pokemons: $pokemons)';
}
