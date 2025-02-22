import 'dart:convert';
import 'package:challenge_banpay/domain/entities/pokemon_ability_entity.dart';

class AbilityModel extends AbilityEntity {
    final int id;
    final bool isMainSeries;
    final String name;
    final List<NameAbilityModel> names;

    AbilityModel({
        required this.id,
        required this.isMainSeries,
        required this.name,
        required this.names,
    }) : super(id: id, isMainSeries: isMainSeries, name: name, names: names);

    factory AbilityModel.fromRawJson(String str) => AbilityModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AbilityModel.fromJson(Map<String, dynamic> json) => AbilityModel(
        id: json["id"],
        isMainSeries: json["is_main_series"],
        name: json["name"],
        names: List<NameAbilityModel>.from(json["names"].map((x) => NameAbilityModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "is_main_series": isMainSeries,
        "name": name,
        "names": List<dynamic>.from(names.map((x) => x.toJson())),
    };

}

class NameAbilityModel extends NameAbilityEntity {
    final LanguageAbilityModel language;
    final String name;

    NameAbilityModel({
        required this.language,
        required this.name,
    }) : super(language: language, name: name);

    factory NameAbilityModel.fromRawJson(String str) => NameAbilityModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory NameAbilityModel.fromJson(Map<String, dynamic> json) => NameAbilityModel(
        language: LanguageAbilityModel.fromJson(json["language"]),
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "language": language.toJson(),
        "name": name,
    };

}

class LanguageAbilityModel extends LanguageAbilityEntity {
    final String name;
    final String url;

    LanguageAbilityModel({
        required this.name,
        required this.url,
    }) : super(name: name, url: url);

    factory LanguageAbilityModel.fromRawJson(String str) => LanguageAbilityModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory LanguageAbilityModel.fromJson(Map<String, dynamic> json) => LanguageAbilityModel(
        name: json["name"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
    };
}
