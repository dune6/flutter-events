// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserEntity _$UserEntityFromJson(Map<String, dynamic> json) => UserEntity(
      id: json['id'] as int?,
      login: json['login'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      years: json['years'] as int? ?? 0,
      gender: json['gender'] as String? ?? '',
      telegram: json['telegram'] as String? ?? '',
      jsonPersonalEvents: json['jsonPersonalEvents'] as String? ?? '',
    );

Map<String, dynamic> _$UserEntityToJson(UserEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'login': instance.login,
      'email': instance.email,
      'password': instance.password,
      'years': instance.years,
      'gender': instance.gender,
      'telegram': instance.telegram,
      'jsonPersonalEvents': instance.jsonPersonalEvents,
    };
