class AbilityEntity {
    final int id;
    final bool isMainSeries;
    final String name;
    final List<NameAbilityEntity> names;

    AbilityEntity({
        required this.id,
        required this.isMainSeries,
        required this.name,
        required this.names,
    });

}

class NameAbilityEntity {
    final LanguageAbilityEntity language;
    final String name;

    NameAbilityEntity({
        required this.language,
        required this.name,
    });

}

class LanguageAbilityEntity {
    final String name;
    final String url;

    LanguageAbilityEntity({
        required this.name,
        required this.url,
    });
}
