class PokemonTypeEntity {
    final int id;
    final String name;
    final List<NameEntity> names;
    final List<PokemonEntity> pokemon;

    PokemonTypeEntity({
        required this.id,
        required this.name,
        required this.names,
        required this.pokemon,
    });

}

class NameEntity {
    final LanguageEntity language;
    final String name;

    NameEntity({
        required this.language,
        required this.name,
    });

}

class LanguageEntity {
    final String name;
    final String url;

    LanguageEntity({
        required this.name,
        required this.url,
    });

}

class PokemonEntity {
    final LanguageEntity pokemon;
    final int slot;

    PokemonEntity({
        required this.pokemon,
        required this.slot,
    });

}
