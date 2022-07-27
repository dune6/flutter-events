import 'package:flutter/services.dart';

class RestApiService {
  final String jsonPath;

  RestApiService({required this.jsonPath});

  Future<String> readEvents() async {
    return await rootBundle
        .loadString(jsonPath)
        .whenComplete(() => Future.delayed(const Duration(seconds: 2)));
  }
}
