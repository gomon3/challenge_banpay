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

}

class NameAbilityModel extends NameAbilityEntity {
    final LanguageAbilityModel language;
    final String name;

    NameAbilityModel({
        required this.language,
        required this.name,
    }) : super(language: language, name: name);

}

class LanguageAbilityModel extends LanguageAbilityEntity {
    final String name;
    final String url;

    LanguageAbilityModel({
        required this.name,
        required this.url,
    }) : super(name: name, url: url);
}
