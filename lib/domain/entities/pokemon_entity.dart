
class PokemonEntity {
  final String id;
  final String name;
  final String smallImageSrc;
  final String imageSrc;
  final int height;
  final int weight;
  String? nickname;
  final List<AbilityElementEntity> abilities;
  final List<TypeEntity> types;

  PokemonEntity({
    required this.id,
    required this.name,
    required this.smallImageSrc,
    required this.imageSrc,
    required this.height,
    required this.weight,
    this.nickname,
    required this.abilities,
    required this.types,
  });
}


class AbilityElementEntity {
  final int slot;
  final TypeClassEntity ability;
  final bool isHidden;
  AbilityElementEntity({
    required this.ability,
    required this.isHidden,
    required this.slot,
  });
}

class TypeEntity {
  final int slot;
  final TypeClassEntity type;
  TypeEntity({
    required this.slot,
    required this.type,
  });
}

class TypeClassEntity {
  final String name;
  final String url;
  TypeClassEntity({
    required this.name,
    required this.url,
  });
}


