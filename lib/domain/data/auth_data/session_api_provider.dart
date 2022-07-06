import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SessionDataProviderKeys {
  static const _apiKey = 'api_key';
}

class SessionDataProvider {
  final _secureStorage = const FlutterSecureStorage();

  Future<String?> apiKey() async {
    return await _secureStorage.read(key: SessionDataProviderKeys._apiKey);
  }

  Future<void> saveApiKey(String key) async {
    await _secureStorage.write(
        key: SessionDataProviderKeys._apiKey, value: key);
  }

  Future<void> clearApiKey() async {
    await _secureStorage.delete(key: SessionDataProviderKeys._apiKey);
  }
}
