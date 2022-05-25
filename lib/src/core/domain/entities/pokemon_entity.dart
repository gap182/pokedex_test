class PokemonEntity {
  PokemonEntity({
    required this.id,
    required this.name,
    required this.baseExperience,
    required this.height,
    required this.weight,
    required this.abilities,
    required this.imageUrl,
    required this.stats,
    required this.types,
  });
  final int id;
  final String name;
  final int baseExperience;
  final int height;
  final int weight;
  final List<String> abilities;
  final String imageUrl;
  final List<PokemonStat> stats;
  final List<String> types;

  PokemonEntity copyWith({
    int? id,
    String? name,
    int? baseExperience,
    int? height,
    int? weight,
    List<String>? abilities,
    String? imageUrl,
    List<PokemonStat>? stats,
    List<String>? types,
  }) {
    return PokemonEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      baseExperience: baseExperience ?? this.baseExperience,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      abilities: abilities ?? this.abilities,
      imageUrl: imageUrl ?? this.imageUrl,
      stats: stats ?? this.stats,
      types: types ?? this.types,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'baseExperience': baseExperience});
    result.addAll({'height': height});
    result.addAll({'weight': weight});
    result.addAll({'abilities': abilities});
    result.addAll({'imageUrl': imageUrl});
    result.addAll({'stats': stats.map((x) => x.toMap()).toList()});
    result.addAll({'types': types});

    return result;
  }

  factory PokemonEntity.fromMap(Map<String, dynamic> map) {
    return PokemonEntity(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      baseExperience: map['baseExperience']?.toInt() ?? 0,
      height: map['height']?.toInt() ?? 0,
      weight: map['weight']?.toInt() ?? 0,
      abilities: List<String>.from(map['abilities']),
      imageUrl: map['imageUrl'] ?? '',
      stats: List<PokemonStat>.from(
          map['stats']?.map((x) => PokemonStat.fromMap(x))),
      types: List<String>.from(map['types']),
    );
  }

  @override
  String toString() {
    return 'PokemonEntity(id: $id, name: $name, baseExperience: $baseExperience, height: $height, weight: $weight, abilities: $abilities, imageUrl: $imageUrl, stats: $stats, types: $types)';
  }
}

class PokemonStat {
  PokemonStat({
    required this.baseStat,
    required this.name,
  });
  final int baseStat;
  final String name;

  PokemonStat copyWith({
    int? baseStat,
    String? name,
  }) {
    return PokemonStat(
      baseStat: baseStat ?? this.baseStat,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'baseStat': baseStat});
    result.addAll({'name': name});

    return result;
  }

  factory PokemonStat.fromMap(Map<String, dynamic> map) {
    return PokemonStat(
      baseStat: map['baseStat']?.toInt() ?? 0,
      name: map['name'] ?? '',
    );
  }

  @override
  String toString() => 'PokemonStat(baseStat: $baseStat, name: $name)';
}
