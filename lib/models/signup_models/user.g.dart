// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserSignAdapter extends TypeAdapter<UserSign> {
  @override
  final int typeId = 1;

  @override
  UserSign read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserSign(
      id: fields[0] as int,
      email: fields[2] as String,
      name: fields[1] as String,
      phoneNumber: fields[3] as String,
      createdAt: fields[5] as String,
      updatedAt: fields[6] as String,
      facebook: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UserSign obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.phoneNumber)
      ..writeByte(4)
      ..write(obj.facebook)
      ..writeByte(5)
      ..write(obj.createdAt)
      ..writeByte(6)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserSignAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserSign _$UserSignFromJson(Map<String, dynamic> json) => UserSign(
      id: json['id'] as int? ?? 0,
      email: json['email'] as String? ?? '',
      name: json['name'] as String? ?? '',
      phoneNumber: json['phone_number'] as String? ?? '',
      createdAt: json['created_at'] as String? ?? '',
      updatedAt: json['updated_at'] as String? ?? '',
      facebook: json['facebook_url'] as String? ?? '',
    );

Map<String, dynamic> _$UserSignToJson(UserSign instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone_number': instance.phoneNumber,
      'facebook_url': instance.facebook,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
