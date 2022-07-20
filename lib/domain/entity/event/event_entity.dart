import 'package:json_annotation/json_annotation.dart';

part 'event_entity.g.dart';

// уровень bd
@JsonSerializable()
class EventEntity {
  EventEntity({
    required this.text,
    required this.place,
    required this.time,
  });

  final String text;
  final String place;
  final String time;

  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'place': place,
      'time': time,
    };
  }

  factory EventEntity.fromMap(Map<String, dynamic> map) {
    return EventEntity(
      text: map['text'] as String,
      place: map['place'] as String,
      time: map['time'] as String,
    );
  }

  factory EventEntity.fromJson(Map<String, dynamic> json) =>
      _$EventEntityFromJson(json);

  Map<String, dynamic> toJson() => _$EventEntityToJson(this);
}
