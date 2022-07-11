import 'package:flutter_events/exceptions/session_provider_exception.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SessionDataProviderKeys {
  static const _apiKey = 'api_key';
}

class SessionDataProvider {
  final _secureStorage = const FlutterSecureStorage();

  Future<String> apiKey() async {
    final login =
        await _secureStorage.read(key: SessionDataProviderKeys._apiKey);
    if (login != null) {
      return login;
    } else {
      throw SessionProviderLoginDoesNotExistException();
    }
  }

  Future<void> saveApiKey(String key) async {
    await _secureStorage.write(
        key: SessionDataProviderKeys._apiKey, value: key);
  }

  Future<void> clearApiKey() async {
    await _secureStorage.delete(key: SessionDataProviderKeys._apiKey);
  }
}
