import 'package:flutter_events/domain/data/auth_data/database_crud_provider.dart';
import 'package:flutter_events/domain/data/auth_data/session_provider.dart';
import 'package:flutter_events/domain/data/db_provider.dart';
import 'package:flutter_events/domain/data/home_screen/rest_api_service.dart';
import 'package:flutter_events/domain/repository/auth_repository/auth_repository.dart';
import 'package:flutter_events/domain/repository/events_service/events_repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class GlobalFactory {
  static final GlobalFactory _globalFactory = GlobalFactory._internal();

  factory GlobalFactory() => _globalFactory;

  GlobalFactory._internal(); // private constructor

  final _dbProvider = DBProvider();
  final _secureStorage = const FlutterSecureStorage();
  final _eventsApiProvider = RestApiService(jsonPath: 'assets/events.json');

  DatabaseCrudProvider _dbRepository() =>
      DatabaseCrudProvider(dbProvider: _dbProvider);

  SessionDataProvider _sessionProvider() =>
      SessionDataProvider(secureStorage: _secureStorage);

  // services
  AuthRepository authService() => AuthRepository(
      sessionDataProvider: _sessionProvider(), dbProvider: _dbRepository());

  EventsRepository eventsService() =>
      EventsRepository(eventsProvider: _eventsApiProvider);
}
