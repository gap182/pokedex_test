import 'dart:convert';

import 'package:pokemon_test/src/core/domain/entities/pokemon_entity.dart';

enum PokedexStatus { initial, loading, done }

class PokedexState {
  PokedexState({
    required this.pokemons,
    required this.favoritePokemons,
    this.pokedexStatus = PokedexStatus.loading,
  });
  final List<PokemonEntity> pokemons;
  final List<PokemonEntity> favoritePokemons;
  final PokedexStatus pokedexStatus;

  PokedexState copyWith({
    List<PokemonEntity>? pokemons,
    List<PokemonEntity>? favoritePokemons,
    PokedexStatus? pokedexStatus,
  }) {
    return PokedexState(
      pokemons: pokemons ?? this.pokemons,
      favoritePokemons: favoritePokemons ?? this.favoritePokemons,
      pokedexStatus: pokedexStatus ?? this.pokedexStatus,
    );
  }

  List<int> getFavoritesId() {
    final favoritesIds = <int>[];
    for (var element in favoritePokemons) {
      favoritesIds.add(element.id);
    }
    return favoritesIds;
  }

  @override
  String toString() =>
      'PokedexState(pokemons: $pokemons, favoritePokemons: $favoritePokemons, pokedexStatus: $pokedexStatus)';

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'pokemons': pokemons.map((x) => x.toMap()).toList()});
    result.addAll(
        {'favoritePokemons': favoritePokemons.map((x) => x.toMap()).toList()});

    return result;
  }

  factory PokedexState.fromMap(Map<String, dynamic> map) {
    return PokedexState(
      pokemons: List<PokemonEntity>.from(
          map['pokemons']?.map((x) => PokemonEntity.fromMap(x))),
      favoritePokemons: List<PokemonEntity>.from(
          map['favoritePokemons']?.map((x) => PokemonEntity.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory PokedexState.fromJson(String source) =>
      PokedexState.fromMap(json.decode(source));
}
