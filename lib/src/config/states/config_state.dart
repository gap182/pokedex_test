import 'dart:convert';

class ConfigState {
  ConfigState({
    required this.baseUrl,
    required this.topLimitPokemons,
  });
  final String baseUrl;
  final int topLimitPokemons;

  ConfigState copyWith({
    String? baseUrl,
    int? topLimitPokemons,
  }) {
    return ConfigState(
      baseUrl: baseUrl ?? this.baseUrl,
      topLimitPokemons: topLimitPokemons ?? this.topLimitPokemons,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'base_url': baseUrl});
    result.addAll({'top_limit_pokemons': topLimitPokemons});

    return result;
  }

  factory ConfigState.fromMap(Map<String, dynamic> map) {
    return ConfigState(
      baseUrl: map['base_url'] ?? '',
      topLimitPokemons: map['top_limit_pokemons']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ConfigState.fromJson(String source) =>
      ConfigState.fromMap(json.decode(source));

  @override
  String toString() =>
      'ConfigState(baseUrl: $baseUrl, topLimitPokemons: $topLimitPokemons)';
}
