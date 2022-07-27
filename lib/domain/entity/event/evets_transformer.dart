import 'package:flutter_events/domain/entity/event/event_entity.dart';
import 'package:flutter_events/domain/entity/event/event_model.dart';

class EventTransformer {
  static EventModel eventEntityToEventModel(EventEntity eventEntity) {
    return EventModel(
      text: eventEntity.text,
      place: eventEntity.place,
      time: eventEntity.time,
    );
  }

  static EventEntity userModelToUserEntity(EventModel eventModel) {
    return EventEntity(
      text: eventModel.text,
      place: eventModel.place,
      time: eventModel.time,
    );
  }
}
