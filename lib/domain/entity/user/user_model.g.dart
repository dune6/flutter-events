// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      login: json['login'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      years: json['years'] as int? ?? 0,
      gender: json['gender'] as String? ?? '',
      telegram: json['telegram'] as String? ?? '',
      personalEvents: (json['personalEvents'] as List<dynamic>?)
              ?.map((e) => EventModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'login': instance.login,
      'email': instance.email,
      'password': instance.password,
      'years': instance.years,
      'gender': instance.gender,
      'telegram': instance.telegram,
      'personalEvents': instance.personalEvents,
    };
