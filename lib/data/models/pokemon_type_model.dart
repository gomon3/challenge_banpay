import 'dart:convert';

import 'package:challenge_banpay/domain/entities/pokemon_type_entity.dart';

class PokemonTypeModel extends PokemonTypeEntity {
    final int id;
    final String name;
    final List<NameModel> names;
    final List<PokemonModel> pokemon;

    PokemonTypeModel({
        required this.id,
        required this.name,
        required this.names,
        required this.pokemon,
    }) : super(id: id, name: name, names: names, pokemon: pokemon);

    factory PokemonTypeModel.fromRawJson(String str) => PokemonTypeModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory PokemonTypeModel.fromJson(Map<String, dynamic> json) => PokemonTypeModel(
        id: json["id"],
        name: json["name"],
        names: List<NameModel>.from(json["names"].map((x) => NameModel.fromJson(x))),
        pokemon: List<PokemonModel>.from(json["pokemon"].map((x) => PokemonModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "names": List<dynamic>.from(names.map((x) => x.toJson())),
        "pokemon": List<dynamic>.from(pokemon.map((x) => x.toJson())),
    };
}

class NameModel extends NameEntity {
    final LanguageModel language;
    final String name;

    NameModel({
        required this.language,
        required this.name,
    }) : super(language: language, name: name);

    factory NameModel.fromRawJson(String str) => NameModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory NameModel.fromJson(Map<String, dynamic> json) => NameModel(
        language: LanguageModel.fromJson(json["language"]),
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "language": language.toJson(),
        "name": name,
    };
}

class LanguageModel extends LanguageEntity {
    final String name;
    final String url;

    LanguageModel({
        required this.name,
        required this.url,
    }) : super(name: name, url: url);

    factory LanguageModel.fromRawJson(String str) => LanguageModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory LanguageModel.fromJson(Map<String, dynamic> json) => LanguageModel(
        name: json["name"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
    };
}

class PokemonModel extends PokemonEntity {
    final LanguageModel pokemon;
    final int slot;

    PokemonModel({
        required this.pokemon,
        required this.slot,
    }) : super(pokemon: pokemon, slot: slot);

    factory PokemonModel.fromRawJson(String str) => PokemonModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory PokemonModel.fromJson(Map<String, dynamic> json) => PokemonModel(
        pokemon: LanguageModel.fromJson(json["pokemon"]),
        slot: json["slot"],
    );

    Map<String, dynamic> toJson() => {
        "pokemon": pokemon.toJson(),
        "slot": slot,
    };
}
