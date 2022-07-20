import 'package:flutter/services.dart';

class EventsApiProvider {
  final String jsonPath;

  EventsApiProvider({required this.jsonPath});

  Future<String> readEvents() async {
    return await rootBundle
        .loadString(jsonPath)
        .whenComplete(() => Future.delayed(const Duration(seconds: 2)));
  }
}
