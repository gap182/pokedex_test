import 'dart:convert';

import 'package:pokemon_test/src/core/domain/entities/pokemon_entity.dart';

PokemonModel pokemonModelFromMap(String str) =>
    PokemonModel.fromMap(json.decode(str));

String pokemonModelToMap(PokemonModel data) => json.encode(data.toMap());

class PokemonModel {
  PokemonModel({
    required this.abilities,
    required this.baseExperience,
    required this.forms,
    required this.gameIndices,
    required this.height,
    required this.heldItems,
    required this.id,
    required this.isDefault,
    required this.locationAreaEncounters,
    required this.moves,
    required this.name,
    required this.order,
    required this.pastTypes,
    required this.species,
    required this.sprites,
    required this.stats,
    required this.types,
    required this.weight,
  });

  final List<Ability>? abilities;
  final int? baseExperience;
  final List<Species>? forms;
  final List<GameIndex>? gameIndices;
  final int? height;
  final List<dynamic>? heldItems;
  final int? id;
  final bool? isDefault;
  final String? locationAreaEncounters;
  final List<Move>? moves;
  final String? name;
  final int? order;
  final List<dynamic>? pastTypes;
  final Species? species;
  final Sprites? sprites;
  final List<Stat>? stats;
  final List<Type>? types;
  final int? weight;

  PokemonModel copyWith({
    List<Ability>? abilities,
    int? baseExperience,
    List<Species>? forms,
    List<GameIndex>? gameIndices,
    int? height,
    List<dynamic>? heldItems,
    int? id,
    bool? isDefault,
    String? locationAreaEncounters,
    List<Move>? moves,
    String? name,
    int? order,
    List<dynamic>? pastTypes,
    Species? species,
    Sprites? sprites,
    List<Stat>? stats,
    List<Type>? types,
    int? weight,
  }) =>
      PokemonModel(
        abilities: abilities ?? this.abilities,
        baseExperience: baseExperience ?? this.baseExperience,
        forms: forms ?? this.forms,
        gameIndices: gameIndices ?? this.gameIndices,
        height: height ?? this.height,
        heldItems: heldItems ?? this.heldItems,
        id: id ?? this.id,
        isDefault: isDefault ?? this.isDefault,
        locationAreaEncounters:
            locationAreaEncounters ?? this.locationAreaEncounters,
        moves: moves ?? this.moves,
        name: name ?? this.name,
        order: order ?? this.order,
        pastTypes: pastTypes ?? this.pastTypes,
        species: species ?? this.species,
        sprites: sprites ?? this.sprites,
        stats: stats ?? this.stats,
        types: types ?? this.types,
        weight: weight ?? this.weight,
      );

  PokemonEntity toEntity() {
    final abilitiesList = <String>[];
    final pokemonStats = <Map<String, dynamic>>[];
    final typesList = <String>[];

    //abilities
    abilities?.forEach((element) {
      if (element.ability?.name != null) {
        abilitiesList.add(element.ability!.name!);
      }
    });

    //image
    final imageUrl = sprites?.other?.home?.frontDefault;

    //poke stats
    stats?.forEach((element) {
      if (element.baseStat != null && element.stat?.name != null) {
        pokemonStats.add({
          "baseStat": element.baseStat,
          "name": element.stat?.name,
        });
      }
    });

    //poke types
    types?.forEach((element) {
      if (element.type?.name != null) {
        typesList.add(element.type!.name!);
      }
    });

    return PokemonEntity.fromMap({
      "id": id,
      "name": name,
      "baseExperience": baseExperience,
      "height": height,
      "weight": weight,
      "abilities": abilitiesList,
      "imageUrl": imageUrl,
      "stats": pokemonStats,
      "types": typesList,
    });
  }

  factory PokemonModel.fromMap(Map<String, dynamic> json) => PokemonModel(
        abilities: json["abilities"] == null
            ? null
            : List<Ability>.from(
                json["abilities"].map((x) => Ability.fromMap(x))),
        baseExperience: json["base_experience"],
        forms: json["forms"] == null
            ? null
            : List<Species>.from(json["forms"].map((x) => Species.fromMap(x))),
        gameIndices: json["game_indices"] == null
            ? null
            : List<GameIndex>.from(
                json["game_indices"].map((x) => GameIndex.fromMap(x))),
        height: json["height"],
        heldItems: json["held_items"] == null
            ? null
            : List<dynamic>.from(json["held_items"].map((x) => x)),
        id: json["id"],
        isDefault: json["is_default"],
        locationAreaEncounters: json["location_area_encounters"],
        moves: json["moves"] == null
            ? null
            : List<Move>.from(json["moves"].map((x) => Move.fromMap(x))),
        name: json["name"],
        order: json["order"],
        pastTypes: json["past_types"] == null
            ? null
            : List<dynamic>.from(json["past_types"].map((x) => x)),
        species:
            json["species"] == null ? null : Species.fromMap(json["species"]),
        sprites:
            json["sprites"] == null ? null : Sprites.fromMap(json["sprites"]),
        stats: json["stats"] == null
            ? null
            : List<Stat>.from(json["stats"].map((x) => Stat.fromMap(x))),
        types: json["types"] == null
            ? null
            : List<Type>.from(json["types"].map((x) => Type.fromMap(x))),
        weight: json["weight"],
      );

  Map<String, dynamic> toMap() => {
        "abilities": abilities == null
            ? null
            : List<dynamic>.from(abilities!.map((x) => x.toMap())),
        "base_experience": baseExperience,
        "forms": forms == null
            ? null
            : List<dynamic>.from(forms!.map((x) => x.toMap())),
        "game_indices": gameIndices == null
            ? null
            : List<dynamic>.from(gameIndices!.map((x) => x.toMap())),
        "height": height,
        "held_items": heldItems == null
            ? null
            : List<dynamic>.from(heldItems!.map((x) => x)),
        "id": id,
        "is_default": isDefault,
        "location_area_encounters": locationAreaEncounters,
        "moves": moves == null
            ? null
            : List<dynamic>.from(moves!.map((x) => x.toMap())),
        "name": name,
        "order": order,
        "past_types": pastTypes == null
            ? null
            : List<dynamic>.from(pastTypes!.map((x) => x)),
        "species": species?.toMap(),
        "sprites": sprites?.toMap(),
        "stats": stats == null
            ? null
            : List<dynamic>.from(stats!.map((x) => x.toMap())),
        "types": types == null
            ? null
            : List<dynamic>.from(types!.map((x) => x.toMap())),
        "weight": weight,
      };
}

class Ability {
  Ability({
    required this.ability,
    required this.isHidden,
    required this.slot,
  });

  final Species? ability;
  final bool? isHidden;
  final int? slot;

  Ability copyWith({
    Species? ability,
    bool? isHidden,
    int? slot,
  }) =>
      Ability(
        ability: ability ?? this.ability,
        isHidden: isHidden ?? this.isHidden,
        slot: slot ?? this.slot,
      );

  factory Ability.fromMap(Map<String, dynamic> json) => Ability(
        ability:
            json["ability"] == null ? null : Species.fromMap(json["ability"]),
        isHidden: json["is_hidden"],
        slot: json["slot"],
      );

  Map<String, dynamic> toMap() => {
        "ability": ability?.toMap(),
        "is_hidden": isHidden,
        "slot": slot,
      };
}

class Species {
  Species({
    required this.name,
    required this.url,
  });

  final String? name;
  final String? url;

  Species copyWith({
    String? name,
    String? url,
  }) =>
      Species(
        name: name ?? this.name,
        url: url ?? this.url,
      );

  factory Species.fromMap(Map<String, dynamic> json) => Species(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "url": url,
      };
}

class GameIndex {
  GameIndex({
    required this.gameIndex,
    required this.version,
  });

  final int? gameIndex;
  final Species? version;

  GameIndex copyWith({
    int? gameIndex,
    Species? version,
  }) =>
      GameIndex(
        gameIndex: gameIndex ?? this.gameIndex,
        version: version ?? this.version,
      );

  factory GameIndex.fromMap(Map<String, dynamic> json) => GameIndex(
        gameIndex: json["game_index"],
        version:
            json["version"] == null ? null : Species.fromMap(json["version"]),
      );

  Map<String, dynamic> toMap() => {
        "game_index": gameIndex,
        "version": version?.toMap(),
      };
}

class Move {
  Move({
    required this.move,
    required this.versionGroupDetails,
  });

  final Species? move;
  final List<VersionGroupDetail>? versionGroupDetails;

  Move copyWith({
    Species? move,
    List<VersionGroupDetail>? versionGroupDetails,
  }) =>
      Move(
        move: move ?? this.move,
        versionGroupDetails: versionGroupDetails ?? this.versionGroupDetails,
      );

  factory Move.fromMap(Map<String, dynamic> json) => Move(
        move: json["move"] == null ? null : Species.fromMap(json["move"]),
        versionGroupDetails: json["version_group_details"] == null
            ? null
            : List<VersionGroupDetail>.from(json["version_group_details"]
                .map((x) => VersionGroupDetail.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "move": move?.toMap(),
        "version_group_details": versionGroupDetails == null
            ? null
            : List<dynamic>.from(versionGroupDetails!.map((x) => x.toMap())),
      };
}

class VersionGroupDetail {
  VersionGroupDetail({
    required this.levelLearnedAt,
    required this.moveLearnMethod,
    required this.versionGroup,
  });

  final int? levelLearnedAt;
  final Species? moveLearnMethod;
  final Species? versionGroup;

  VersionGroupDetail copyWith({
    int? levelLearnedAt,
    Species? moveLearnMethod,
    Species? versionGroup,
  }) =>
      VersionGroupDetail(
        levelLearnedAt: levelLearnedAt ?? this.levelLearnedAt,
        moveLearnMethod: moveLearnMethod ?? this.moveLearnMethod,
        versionGroup: versionGroup ?? this.versionGroup,
      );

  factory VersionGroupDetail.fromMap(Map<String, dynamic> json) =>
      VersionGroupDetail(
        levelLearnedAt: json["level_learned_at"],
        moveLearnMethod: json["move_learn_method"] == null
            ? null
            : Species.fromMap(json["move_learn_method"]),
        versionGroup: json["version_group"] == null
            ? null
            : Species.fromMap(json["version_group"]),
      );

  Map<String, dynamic> toMap() => {
        "level_learned_at": levelLearnedAt,
        "move_learn_method": moveLearnMethod?.toMap(),
        "version_group": versionGroup?.toMap(),
      };
}

class GenerationV {
  GenerationV({
    required this.blackWhite,
  });

  final Sprites? blackWhite;

  GenerationV copyWith({
    Sprites? blackWhite,
  }) =>
      GenerationV(
        blackWhite: blackWhite ?? this.blackWhite,
      );

  factory GenerationV.fromMap(Map<String, dynamic> json) => GenerationV(
        blackWhite: json["black-white"] == null
            ? null
            : Sprites.fromMap(json["black-white"]),
      );

  Map<String, dynamic> toMap() => {
        "black-white": blackWhite?.toMap(),
      };
}

class GenerationIv {
  GenerationIv({
    required this.diamondPearl,
    required this.heartgoldSoulsilver,
    required this.platinum,
  });

  final Sprites? diamondPearl;
  final Sprites? heartgoldSoulsilver;
  final Sprites? platinum;

  GenerationIv copyWith({
    Sprites? diamondPearl,
    Sprites? heartgoldSoulsilver,
    Sprites? platinum,
  }) =>
      GenerationIv(
        diamondPearl: diamondPearl ?? this.diamondPearl,
        heartgoldSoulsilver: heartgoldSoulsilver ?? this.heartgoldSoulsilver,
        platinum: platinum ?? this.platinum,
      );

  factory GenerationIv.fromMap(Map<String, dynamic> json) => GenerationIv(
        diamondPearl: json["diamond-pearl"] == null
            ? null
            : Sprites.fromMap(json["diamond-pearl"]),
        heartgoldSoulsilver: json["heartgold-soulsilver"] == null
            ? null
            : Sprites.fromMap(json["heartgold-soulsilver"]),
        platinum:
            json["platinum"] == null ? null : Sprites.fromMap(json["platinum"]),
      );

  Map<String, dynamic> toMap() => {
        "diamond-pearl": diamondPearl?.toMap(),
        "heartgold-soulsilver": heartgoldSoulsilver?.toMap(),
        "platinum": platinum?.toMap(),
      };
}

class Versions {
  Versions({
    required this.generationI,
    required this.generationIi,
    required this.generationIii,
    required this.generationIv,
    required this.generationV,
    required this.generationVi,
    required this.generationVii,
    required this.generationViii,
  });

  final GenerationI? generationI;
  final GenerationIi? generationIi;
  final GenerationIii? generationIii;
  final GenerationIv? generationIv;
  final GenerationV? generationV;
  final Map<String, Home>? generationVi;
  final GenerationVii? generationVii;
  final GenerationViii? generationViii;

  Versions copyWith({
    GenerationI? generationI,
    GenerationIi? generationIi,
    GenerationIii? generationIii,
    GenerationIv? generationIv,
    GenerationV? generationV,
    Map<String, Home>? generationVi,
    GenerationVii? generationVii,
    GenerationViii? generationViii,
  }) =>
      Versions(
        generationI: generationI ?? this.generationI,
        generationIi: generationIi ?? this.generationIi,
        generationIii: generationIii ?? this.generationIii,
        generationIv: generationIv ?? this.generationIv,
        generationV: generationV ?? this.generationV,
        generationVi: generationVi ?? this.generationVi,
        generationVii: generationVii ?? this.generationVii,
        generationViii: generationViii ?? this.generationViii,
      );

  factory Versions.fromMap(Map<String, dynamic> json) => Versions(
        generationI: json["generation-i"] == null
            ? null
            : GenerationI.fromMap(json["generation-i"]),
        generationIi: json["generation-ii"] == null
            ? null
            : GenerationIi.fromMap(json["generation-ii"]),
        generationIii: json["generation-iii"] == null
            ? null
            : GenerationIii.fromMap(json["generation-iii"]),
        generationIv: json["generation-iv"] == null
            ? null
            : GenerationIv.fromMap(json["generation-iv"]),
        generationV: json["generation-v"] == null
            ? null
            : GenerationV.fromMap(json["generation-v"]),
        generationVi: json["generation-vi"] == null
            ? null
            : Map.from(json["generation-vi"])
                .map((k, v) => MapEntry<String, Home>(k, Home.fromMap(v))),
        generationVii: json["generation-vii"] == null
            ? null
            : GenerationVii.fromMap(json["generation-vii"]),
        generationViii: json["generation-viii"] == null
            ? null
            : GenerationViii.fromMap(json["generation-viii"]),
      );

  Map<String, dynamic> toMap() => {
        "generation-i": generationI?.toMap(),
        "generation-ii": generationIi?.toMap(),
        "generation-iii": generationIii?.toMap(),
        "generation-iv": generationIv?.toMap(),
        "generation-v": generationV?.toMap(),
        "generation-vi": generationVi == null
            ? null
            : Map.from(generationVi!)
                .map((k, v) => MapEntry<String, dynamic>(k, v.toMap())),
        "generation-vii": generationVii?.toMap(),
        "generation-viii": generationViii?.toMap(),
      };
}

class Sprites {
  Sprites({
    required this.backDefault,
    required this.backFemale,
    required this.backShiny,
    required this.backShinyFemale,
    required this.frontDefault,
    required this.frontFemale,
    required this.frontShiny,
    required this.frontShinyFemale,
    required this.other,
    required this.versions,
    required this.animated,
  });

  final String? backDefault;
  final dynamic backFemale;
  final String? backShiny;
  final dynamic backShinyFemale;
  final String? frontDefault;
  final dynamic frontFemale;
  final String? frontShiny;
  final dynamic frontShinyFemale;
  final Other? other;
  final Versions? versions;
  final Sprites? animated;

  Sprites copyWith({
    String? backDefault,
    dynamic backFemale,
    String? backShiny,
    dynamic backShinyFemale,
    String? frontDefault,
    dynamic frontFemale,
    String? frontShiny,
    dynamic frontShinyFemale,
    Other? other,
    Versions? versions,
    Sprites? animated,
  }) =>
      Sprites(
        backDefault: backDefault ?? this.backDefault,
        backFemale: backFemale ?? this.backFemale,
        backShiny: backShiny ?? this.backShiny,
        backShinyFemale: backShinyFemale ?? this.backShinyFemale,
        frontDefault: frontDefault ?? this.frontDefault,
        frontFemale: frontFemale ?? this.frontFemale,
        frontShiny: frontShiny ?? this.frontShiny,
        frontShinyFemale: frontShinyFemale ?? this.frontShinyFemale,
        other: other ?? this.other,
        versions: versions ?? this.versions,
        animated: animated ?? this.animated,
      );

  factory Sprites.fromMap(Map<String, dynamic> json) => Sprites(
        backDefault: json["back_default"],
        backFemale: json["back_female"],
        backShiny: json["back_shiny"],
        backShinyFemale: json["back_shiny_female"],
        frontDefault: json["front_default"],
        frontFemale: json["front_female"],
        frontShiny: json["front_shiny"],
        frontShinyFemale: json["front_shiny_female"],
        other: json["other"] == null ? null : Other.fromMap(json["other"]),
        versions: json["versions"] == null
            ? null
            : Versions.fromMap(json["versions"]),
        animated:
            json["animated"] == null ? null : Sprites.fromMap(json["animated"]),
      );

  Map<String, dynamic> toMap() => {
        "back_default": backDefault,
        "back_female": backFemale,
        "back_shiny": backShiny,
        "back_shiny_female": backShinyFemale,
        "front_default": frontDefault,
        "front_female": frontFemale,
        "front_shiny": frontShiny,
        "front_shiny_female": frontShinyFemale,
        "other": other?.toMap(),
        "versions": versions?.toMap(),
        "animated": animated?.toMap(),
      };
}

class GenerationI {
  GenerationI({
    required this.redBlue,
    required this.yellow,
  });

  final RedBlue? redBlue;
  final RedBlue? yellow;

  GenerationI copyWith({
    RedBlue? redBlue,
    RedBlue? yellow,
  }) =>
      GenerationI(
        redBlue: redBlue ?? this.redBlue,
        yellow: yellow ?? this.yellow,
      );

  factory GenerationI.fromMap(Map<String, dynamic> json) => GenerationI(
        redBlue:
            json["red-blue"] == null ? null : RedBlue.fromMap(json["red-blue"]),
        yellow: json["yellow"] == null ? null : RedBlue.fromMap(json["yellow"]),
      );

  Map<String, dynamic> toMap() => {
        "red-blue": redBlue?.toMap(),
        "yellow": yellow?.toMap(),
      };
}

class RedBlue {
  RedBlue({
    required this.backDefault,
    required this.backGray,
    required this.backTransparent,
    required this.frontDefault,
    required this.frontGray,
    required this.frontTransparent,
  });

  final String? backDefault;
  final String? backGray;
  final String? backTransparent;
  final String? frontDefault;
  final String? frontGray;
  final String? frontTransparent;

  RedBlue copyWith({
    String? backDefault,
    String? backGray,
    String? backTransparent,
    String? frontDefault,
    String? frontGray,
    String? frontTransparent,
  }) =>
      RedBlue(
        backDefault: backDefault ?? this.backDefault,
        backGray: backGray ?? this.backGray,
        backTransparent: backTransparent ?? this.backTransparent,
        frontDefault: frontDefault ?? this.frontDefault,
        frontGray: frontGray ?? this.frontGray,
        frontTransparent: frontTransparent ?? this.frontTransparent,
      );

  factory RedBlue.fromMap(Map<String, dynamic> json) => RedBlue(
        backDefault: json["back_default"],
        backGray: json["back_gray"],
        backTransparent: json["back_transparent"],
        frontDefault: json["front_default"],
        frontGray: json["front_gray"],
        frontTransparent: json["front_transparent"],
      );

  Map<String, dynamic> toMap() => {
        "back_default": backDefault,
        "back_gray": backGray,
        "back_transparent": backTransparent,
        "front_default": frontDefault,
        "front_gray": frontGray,
        "front_transparent": frontTransparent,
      };
}

class GenerationIi {
  GenerationIi({
    required this.crystal,
    required this.gold,
    required this.silver,
  });

  final Crystal? crystal;
  final Gold? gold;
  final Gold? silver;

  GenerationIi copyWith({
    Crystal? crystal,
    Gold? gold,
    Gold? silver,
  }) =>
      GenerationIi(
        crystal: crystal ?? this.crystal,
        gold: gold ?? this.gold,
        silver: silver ?? this.silver,
      );

  factory GenerationIi.fromMap(Map<String, dynamic> json) => GenerationIi(
        crystal:
            json["crystal"] == null ? null : Crystal.fromMap(json["crystal"]),
        gold: json["gold"] == null ? null : Gold.fromMap(json["gold"]),
        silver: json["silver"] == null ? null : Gold.fromMap(json["silver"]),
      );

  Map<String, dynamic> toMap() => {
        "crystal": crystal?.toMap(),
        "gold": gold?.toMap(),
        "silver": silver?.toMap(),
      };
}

class Crystal {
  Crystal({
    required this.backDefault,
    required this.backShiny,
    required this.backShinyTransparent,
    required this.backTransparent,
    required this.frontDefault,
    required this.frontShiny,
    required this.frontShinyTransparent,
    required this.frontTransparent,
  });

  final String? backDefault;
  final String? backShiny;
  final String? backShinyTransparent;
  final String? backTransparent;
  final String? frontDefault;
  final String? frontShiny;
  final String? frontShinyTransparent;
  final String? frontTransparent;

  Crystal copyWith({
    String? backDefault,
    String? backShiny,
    String? backShinyTransparent,
    String? backTransparent,
    String? frontDefault,
    String? frontShiny,
    String? frontShinyTransparent,
    String? frontTransparent,
  }) =>
      Crystal(
        backDefault: backDefault ?? this.backDefault,
        backShiny: backShiny ?? this.backShiny,
        backShinyTransparent: backShinyTransparent ?? this.backShinyTransparent,
        backTransparent: backTransparent ?? this.backTransparent,
        frontDefault: frontDefault ?? this.frontDefault,
        frontShiny: frontShiny ?? this.frontShiny,
        frontShinyTransparent:
            frontShinyTransparent ?? this.frontShinyTransparent,
        frontTransparent: frontTransparent ?? this.frontTransparent,
      );

  factory Crystal.fromMap(Map<String, dynamic> json) => Crystal(
        backDefault: json["back_default"],
        backShiny: json["back_shiny"],
        backShinyTransparent: json["back_shiny_transparent"],
        backTransparent: json["back_transparent"],
        frontDefault: json["front_default"],
        frontShiny: json["front_shiny"],
        frontShinyTransparent: json["front_shiny_transparent"],
        frontTransparent: json["front_transparent"],
      );

  Map<String, dynamic> toMap() => {
        "back_default": backDefault,
        "back_shiny": backShiny,
        "back_shiny_transparent": backShinyTransparent,
        "back_transparent": backTransparent,
        "front_default": frontDefault,
        "front_shiny": frontShiny,
        "front_shiny_transparent": frontShinyTransparent,
        "front_transparent": frontTransparent,
      };
}

class Gold {
  Gold({
    required this.backDefault,
    required this.backShiny,
    required this.frontDefault,
    required this.frontShiny,
    required this.frontTransparent,
  });

  final String? backDefault;
  final String? backShiny;
  final String? frontDefault;
  final String? frontShiny;
  final String? frontTransparent;

  Gold copyWith({
    String? backDefault,
    String? backShiny,
    String? frontDefault,
    String? frontShiny,
    String? frontTransparent,
  }) =>
      Gold(
        backDefault: backDefault ?? this.backDefault,
        backShiny: backShiny ?? this.backShiny,
        frontDefault: frontDefault ?? this.frontDefault,
        frontShiny: frontShiny ?? this.frontShiny,
        frontTransparent: frontTransparent ?? this.frontTransparent,
      );

  factory Gold.fromMap(Map<String, dynamic> json) => Gold(
        backDefault: json["back_default"],
        backShiny: json["back_shiny"],
        frontDefault: json["front_default"],
        frontShiny: json["front_shiny"],
        frontTransparent: json["front_transparent"],
      );

  Map<String, dynamic> toMap() => {
        "back_default": backDefault,
        "back_shiny": backShiny,
        "front_default": frontDefault,
        "front_shiny": frontShiny,
        "front_transparent": frontTransparent,
      };
}

class GenerationIii {
  GenerationIii({
    required this.emerald,
    required this.fireredLeafgreen,
    required this.rubySapphire,
  });

  final Emerald? emerald;
  final Gold? fireredLeafgreen;
  final Gold? rubySapphire;

  GenerationIii copyWith({
    Emerald? emerald,
    Gold? fireredLeafgreen,
    Gold? rubySapphire,
  }) =>
      GenerationIii(
        emerald: emerald ?? this.emerald,
        fireredLeafgreen: fireredLeafgreen ?? this.fireredLeafgreen,
        rubySapphire: rubySapphire ?? this.rubySapphire,
      );

  factory GenerationIii.fromMap(Map<String, dynamic> json) => GenerationIii(
        emerald:
            json["emerald"] == null ? null : Emerald.fromMap(json["emerald"]),
        fireredLeafgreen: json["firered-leafgreen"] == null
            ? null
            : Gold.fromMap(json["firered-leafgreen"]),
        rubySapphire: json["ruby-sapphire"] == null
            ? null
            : Gold.fromMap(json["ruby-sapphire"]),
      );

  Map<String, dynamic> toMap() => {
        "emerald": emerald?.toMap(),
        "firered-leafgreen": fireredLeafgreen?.toMap(),
        "ruby-sapphire": rubySapphire?.toMap(),
      };
}

class Emerald {
  Emerald({
    required this.frontDefault,
    required this.frontShiny,
  });

  final String? frontDefault;
  final String? frontShiny;

  Emerald copyWith({
    String? frontDefault,
    String? frontShiny,
  }) =>
      Emerald(
        frontDefault: frontDefault ?? this.frontDefault,
        frontShiny: frontShiny ?? this.frontShiny,
      );

  factory Emerald.fromMap(Map<String, dynamic> json) => Emerald(
        frontDefault: json["front_default"],
        frontShiny: json["front_shiny"],
      );

  Map<String, dynamic> toMap() => {
        "front_default": frontDefault,
        "front_shiny": frontShiny,
      };
}

class Home {
  Home({
    required this.frontDefault,
    required this.frontFemale,
    required this.frontShiny,
    required this.frontShinyFemale,
  });

  final String? frontDefault;
  final dynamic frontFemale;
  final String? frontShiny;
  final dynamic frontShinyFemale;

  Home copyWith({
    String? frontDefault,
    dynamic frontFemale,
    String? frontShiny,
    dynamic frontShinyFemale,
  }) =>
      Home(
        frontDefault: frontDefault ?? this.frontDefault,
        frontFemale: frontFemale ?? this.frontFemale,
        frontShiny: frontShiny ?? this.frontShiny,
        frontShinyFemale: frontShinyFemale ?? this.frontShinyFemale,
      );

  factory Home.fromMap(Map<String, dynamic> json) => Home(
        frontDefault: json["front_default"],
        frontFemale: json["front_female"],
        frontShiny: json["front_shiny"],
        frontShinyFemale: json["front_shiny_female"],
      );

  Map<String, dynamic> toMap() => {
        "front_default": frontDefault,
        "front_female": frontFemale,
        "front_shiny": frontShiny,
        "front_shiny_female": frontShinyFemale,
      };
}

class GenerationVii {
  GenerationVii({
    required this.icons,
    required this.ultraSunUltraMoon,
  });

  final DreamWorld? icons;
  final Home? ultraSunUltraMoon;

  GenerationVii copyWith({
    DreamWorld? icons,
    Home? ultraSunUltraMoon,
  }) =>
      GenerationVii(
        icons: icons ?? this.icons,
        ultraSunUltraMoon: ultraSunUltraMoon ?? this.ultraSunUltraMoon,
      );

  factory GenerationVii.fromMap(Map<String, dynamic> json) => GenerationVii(
        icons: json["icons"] == null ? null : DreamWorld.fromMap(json["icons"]),
        ultraSunUltraMoon: json["ultra-sun-ultra-moon"] == null
            ? null
            : Home.fromMap(json["ultra-sun-ultra-moon"]),
      );

  Map<String, dynamic> toMap() => {
        "icons": icons?.toMap(),
        "ultra-sun-ultra-moon": ultraSunUltraMoon?.toMap(),
      };
}

class DreamWorld {
  DreamWorld({
    required this.frontDefault,
    required this.frontFemale,
  });

  final String? frontDefault;
  final dynamic frontFemale;

  DreamWorld copyWith({
    String? frontDefault,
    dynamic frontFemale,
  }) =>
      DreamWorld(
        frontDefault: frontDefault ?? this.frontDefault,
        frontFemale: frontFemale ?? this.frontFemale,
      );

  factory DreamWorld.fromMap(Map<String, dynamic> json) => DreamWorld(
        frontDefault: json["front_default"],
        frontFemale: json["front_female"],
      );

  Map<String, dynamic> toMap() => {
        "front_default": frontDefault,
        "front_female": frontFemale,
      };
}

class GenerationViii {
  GenerationViii({
    required this.icons,
  });

  final DreamWorld? icons;

  GenerationViii copyWith({
    DreamWorld? icons,
  }) =>
      GenerationViii(
        icons: icons ?? this.icons,
      );

  factory GenerationViii.fromMap(Map<String, dynamic> json) => GenerationViii(
        icons: json["icons"] == null ? null : DreamWorld.fromMap(json["icons"]),
      );

  Map<String, dynamic> toMap() => {
        "icons": icons?.toMap(),
      };
}

class Other {
  Other({
    required this.dreamWorld,
    required this.home,
    required this.officialArtwork,
  });

  final DreamWorld? dreamWorld;
  final Home? home;
  final OfficialArtwork? officialArtwork;

  Other copyWith({
    DreamWorld? dreamWorld,
    Home? home,
    OfficialArtwork? officialArtwork,
  }) =>
      Other(
        dreamWorld: dreamWorld ?? this.dreamWorld,
        home: home ?? this.home,
        officialArtwork: officialArtwork ?? this.officialArtwork,
      );

  factory Other.fromMap(Map<String, dynamic> json) => Other(
        dreamWorld: json["dream_world"] == null
            ? null
            : DreamWorld.fromMap(json["dream_world"]),
        home: json["home"] == null ? null : Home.fromMap(json["home"]),
        officialArtwork: json["official-artwork"] == null
            ? null
            : OfficialArtwork.fromMap(json["official-artwork"]),
      );

  Map<String, dynamic> toMap() => {
        "dream_world": dreamWorld?.toMap(),
        "home": home?.toMap(),
        "official-artwork": officialArtwork?.toMap(),
      };
}

class OfficialArtwork {
  OfficialArtwork({
    required this.frontDefault,
  });

  final String? frontDefault;

  OfficialArtwork copyWith({
    String? frontDefault,
  }) =>
      OfficialArtwork(
        frontDefault: frontDefault ?? this.frontDefault,
      );

  factory OfficialArtwork.fromMap(Map<String, dynamic> json) => OfficialArtwork(
        frontDefault: json["front_default"],
      );

  Map<String, dynamic> toMap() => {
        "front_default": frontDefault,
      };
}

class Stat {
  Stat({
    required this.baseStat,
    required this.effort,
    required this.stat,
  });

  final int? baseStat;
  final int? effort;
  final Species? stat;

  Stat copyWith({
    int? baseStat,
    int? effort,
    Species? stat,
  }) =>
      Stat(
        baseStat: baseStat ?? this.baseStat,
        effort: effort ?? this.effort,
        stat: stat ?? this.stat,
      );

  factory Stat.fromMap(Map<String, dynamic> json) => Stat(
        baseStat: json["base_stat"],
        effort: json["effort"],
        stat: json["stat"] == null ? null : Species.fromMap(json["stat"]),
      );

  Map<String, dynamic> toMap() => {
        "base_stat": baseStat,
        "effort": effort,
        "stat": stat?.toMap(),
      };
}

class Type {
  Type({
    required this.slot,
    required this.type,
  });

  final int? slot;
  final Species? type;

  Type copyWith({
    int? slot,
    Species? type,
  }) =>
      Type(
        slot: slot ?? this.slot,
        type: type ?? this.type,
      );

  factory Type.fromMap(Map<String, dynamic> json) => Type(
        slot: json["slot"],
        type: json["type"] == null ? null : Species.fromMap(json["type"]),
      );

  Map<String, dynamic> toMap() => {
        "slot": slot,
        "type": type?.toMap(),
      };
}
