// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PokemonModelAdapter extends TypeAdapter<PokemonModel> {
  @override
  final int typeId = 0;

  @override
  PokemonModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PokemonModel(
      id: fields[0] as String,
      name: fields[1] as String,
      smallImageSrc: fields[2] as String,
      imageSrc: fields[3] as String,
      height: fields[4] as int,
      weight: fields[5] as int,
      abilities: (fields[6] as List).cast<AbilityElementModel>(),
      types: (fields[7] as List).cast<TypeModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, PokemonModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.smallImageSrc)
      ..writeByte(3)
      ..write(obj.imageSrc)
      ..writeByte(4)
      ..write(obj.height)
      ..writeByte(5)
      ..write(obj.weight)
      ..writeByte(6)
      ..write(obj.abilities)
      ..writeByte(7)
      ..write(obj.types);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PokemonModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AbilityElementModelAdapter extends TypeAdapter<AbilityElementModel> {
  @override
  final int typeId = 1;

  @override
  AbilityElementModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AbilityElementModel(
      ability: fields[1] as TypeClassModel,
      isHidden: fields[2] as bool,
      slot: fields[0] as int,
    );
  }

  @override
  void write(BinaryWriter writer, AbilityElementModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.slot)
      ..writeByte(1)
      ..write(obj.ability)
      ..writeByte(2)
      ..write(obj.isHidden);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AbilityElementModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MyTypeAdapter extends TypeAdapter<TypeModel> {
  @override
  final int typeId = 2;

  @override
  TypeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TypeModel(
      slot: fields[0] as int,
      type: fields[1] as TypeClassModel,
    );
  }

  @override
  void write(BinaryWriter writer, TypeModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.slot)
      ..writeByte(1)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MyTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TypeClassModelAdapter extends TypeAdapter<TypeClassModel> {
  @override
  final int typeId = 3;

  @override
  TypeClassModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TypeClassModel(
      name: fields[0] as String,
      url: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TypeClassModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.url);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TypeClassModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
