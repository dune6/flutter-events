import 'dart:io';

import 'package:flutter_events/domain/data/auth_data/database_repository.dart';
import 'package:flutter_events/domain/data/auth_data/session_provider.dart';
import 'package:flutter_events/domain/data/db_provider.dart';
import 'package:flutter_events/domain/data/home_screen/events_api_provider.dart';
import 'package:flutter_events/domain/repository/auth_service/auth_service.dart';
import 'package:flutter_events/domain/repository/events_service/events_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class GlobalFactory {
  static final GlobalFactory _globalFactory = GlobalFactory._internal();

  factory GlobalFactory() => _globalFactory;

  GlobalFactory._internal(); // private constructor

  final _dbProvider = DBProvider();
  final _secureStorage = const FlutterSecureStorage();
  final _eventsApiProvider = EventsApiProvider(jsonPath: 'assets/events.json');

  DBRepository _dbRepository() => DBRepository(dbProvider: _dbProvider);

  SessionDataProvider _sessionProvider() =>
      SessionDataProvider(secureStorage: _secureStorage);

  // services
  AuthService authService() => AuthService(
      sessionDataProvider: _sessionProvider(), dbRepository: _dbRepository());

  EventsService eventsService() =>
      EventsService(eventsProvider: _eventsApiProvider);
}
