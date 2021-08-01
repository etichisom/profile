// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 2;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User(
      name: fields[0] as String,
      email: fields[1] as String,
      about: fields[2] as String,
      followers: fields[3] as int,
      ranking: fields[4] as String,
      following: fields[5] as int,
      dp: fields[6] as String,
      password: fields[7] as String,
      number: fields[8] as int,
      uid: fields[9] as String,
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.about)
      ..writeByte(3)
      ..write(obj.followers)
      ..writeByte(4)
      ..write(obj.ranking)
      ..writeByte(5)
      ..write(obj.following)
      ..writeByte(6)
      ..write(obj.dp)
      ..writeByte(7)
      ..write(obj.password)
      ..writeByte(8)
      ..write(obj.number)
      ..writeByte(9)
      ..write(obj.uid);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
