import 'package:challenge_banpay/domain/entities/pokemon_entity.dart';
import 'package:hive/hive.dart';
import 'dart:convert';

part 'pokemon_model.g.dart';

@HiveType(typeId: 0)
class PokemonModel extends PokemonEntity {
  @HiveField(0)
  final String id;

  @override
  @HiveField(1)
  final String name;

  @HiveField(2)
  final String smallImageSrc;

  @HiveField(3)
  final String imageSrc;

  @HiveField(4)
  final int height;

  @HiveField(5)
  final int weight;

  @HiveField(6)
  final String? nickname;

  @HiveField(7)
  final List<AbilityElementModel> abilities;

  @HiveField(8)
  final List<TypeModel> types;

  PokemonModel({
    required this.id,
    required this.name,
    required this.smallImageSrc,
    required this.imageSrc,
    required this.height,
    required this.weight,
    this.nickname,
    required this.abilities,
    required this.types,
  }) : super(
          id: id,
          name: name,
          smallImageSrc: smallImageSrc,
          imageSrc: imageSrc,
          height: height,
          weight: weight,
          nickname: nickname,
          abilities: abilities,
          types: types,
        );

  factory PokemonModel.fromRawJson(String str) =>
      PokemonModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PokemonModel.fromJson(Map<String, dynamic> json) => PokemonModel(
        id: json["id"],
        name: json["name"],
        smallImageSrc: json["smallImageSrc"],
        imageSrc: json["imageSrc"],
        height: json["height"],
        weight: json["weight"],
        nickname: json["nickname"],
        abilities: List<AbilityElementModel>.from(
            json["abilities"].map((x) => AbilityElementModel.fromJson(x))),
        types: List<TypeModel>.from(
            json["types"].map((x) => TypeModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "smallImageSrc": smallImageSrc,
        "imageSrc": imageSrc,
        "height": height,
        "weight": weight,
        "nickname": nickname,
        "abilities": List<dynamic>.from(abilities.map((x) => x.toJson())),
        "types": List<dynamic>.from(types.map((x) => x.toJson())),
      };
}

@HiveType(typeId: 1)
class AbilityElementModel extends AbilityElementEntity {
  @HiveField(0)
  final int slot;

  @HiveField(1)
  final TypeClassModel ability;

  @HiveField(2)
  final bool isHidden;

  AbilityElementModel({
    required this.ability,
    required this.isHidden,
    required this.slot,
  }) : super(
          ability: ability,
          isHidden: isHidden,
          slot: slot,
        );

  factory AbilityElementModel.fromRawJson(String str) =>
      AbilityElementModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AbilityElementModel.fromJson(Map<String, dynamic> json) =>
      AbilityElementModel(
        ability: TypeClassModel.fromJson(json["ability"]),
        isHidden: json["is_hidden"],
        slot: json["slot"],
      );

  Map<String, dynamic> toJson() => {
        "ability": ability.toJson(),
        "is_hidden": isHidden,
        "slot": slot,
      };
}

@HiveType(typeId: 2, adapterName: 'MyTypeAdapter')
class TypeModel extends TypeEntity {
  @HiveField(0)
  final int slot;

  @HiveField(1)
  final TypeClassModel type;

  TypeModel({
    required this.slot,
    required this.type,
  }) : super(
          slot: slot,
          type: type,
        );

  factory TypeModel.fromRawJson(String str) =>
      TypeModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TypeModel.fromJson(Map<String, dynamic> json) => TypeModel(
        slot: json["slot"],
        type: TypeClassModel.fromJson(json["type"]),
      );

  Map<String, dynamic> toJson() => {
        "slot": slot,
        "type": type.toJson(),
      };
}

@HiveType(typeId: 3)
class TypeClassModel extends TypeClassEntity {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String url;

  TypeClassModel({
    required this.name,
    required this.url,
  }) : super(
          name: name,
          url: url,
        );

  factory TypeClassModel.fromRawJson(String str) =>
      TypeClassModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TypeClassModel.fromJson(Map<String, dynamic> json) => TypeClassModel(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}
