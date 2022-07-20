import 'package:json_annotation/json_annotation.dart';

part 'event_model.g.dart';

// уровень UI, ViewModel
@JsonSerializable()
class EventModel {
  EventModel({
    required this.text,
    required this.place,
    required this.time,
  });

  final String text;
  final String place;
  final String time;

  factory EventModel.fromJson(Map<String, dynamic> json) =>
      _$EventModelFromJson(json);

  Map<String, dynamic> toJson() => _$EventModelToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EventModel &&
          runtimeType == other.runtimeType &&
          text == other.text &&
          place == other.place &&
          time == other.time;

  @override
  int get hashCode => text.hashCode ^ place.hashCode ^ time.hashCode;
}
