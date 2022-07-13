// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventEntity _$EventEntityFromJson(Map<String, dynamic> json) => EventEntity(
      text: json['text'] as String,
      place: json['place'] as String,
      time: json['time'] as String,
    );

Map<String, dynamic> _$EventEntityToJson(EventEntity instance) =>
    <String, dynamic>{
      'text': instance.text,
      'place': instance.place,
      'time': instance.time,
    };
