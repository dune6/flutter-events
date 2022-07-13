import 'package:flutter_events/exceptions/session_provider_exception.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SessionDataProviderKeys {
  static const _login = 'login';
}

class SessionDataProvider {
  final FlutterSecureStorage secureStorage;

  SessionDataProvider({required this.secureStorage});

  Future<String> getUserLogin() async {
    final login =
        await secureStorage.read(key: SessionDataProviderKeys._login);
    if (login != null) {
      return login;
    } else {
      throw SessionProviderLoginDoesNotExistException();
    }
  }

  Future<void> saveLoginKey(String key) async {
    await secureStorage.write(key: SessionDataProviderKeys._login, value: key);
  }

  Future<void> clearLoginKey() async {
    await secureStorage.delete(key: SessionDataProviderKeys._login);
  }
}
