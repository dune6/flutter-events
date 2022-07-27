import 'dart:convert';

import 'package:flutter_events/domain/data/home_screen/rest_api_service.dart';
import 'package:flutter_events/domain/entity/event/event_model.dart';

class EventsRepository {
  final RestApiService eventsProvider;

  EventsRepository({required this.eventsProvider});

  Future<List<EventModel>> getEventsRestAPI() async {
    final listOfEvents =
        (jsonDecode(await eventsProvider.readEvents()) as List<dynamic>)
            .map((e) => EventModel.fromJson(e))
            .toList();
    return listOfEvents;
  }
}
