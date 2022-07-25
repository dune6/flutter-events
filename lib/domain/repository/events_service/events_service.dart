import 'dart:convert';

import 'package:flutter_events/domain/data/home_screen/events_api_provider.dart';
import 'package:flutter_events/domain/entity/event/event_model.dart';

class EventsService {
  final EventsApiProvider eventsProvider;

  EventsService({required this.eventsProvider});

  Future<List<EventModel>> getEventsRestAPI() async {
    final listOfEvents =
        (jsonDecode(await eventsProvider.readEvents()) as List<dynamic>)
            .map((e) => EventModel.fromJson(e))
            .toList();
    return listOfEvents;
  }
}
